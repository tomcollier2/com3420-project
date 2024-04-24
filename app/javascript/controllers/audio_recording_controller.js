import ApplicationController from './application_controller.js'
import StimulusReflex from 'stimulus_reflex'
import RecordRTC from "recordrtc";
import {
  serializeFormData,
  triggerChange
} from "helpers";export default class extends ApplicationController {
  static targets = ["startRecording", "stopRecording", 'resumeRecording', 'pauseRecording', "recordedAudio", "audioBlob", 'timeElapsed'];

  connect() {
   StimulusReflex.register(this)
    this.timerInterval = null;
    this.secondsElapsed = 0;
  }

  startRecordingWithDuration(event) {
    event.preventDefault();
    const durationInput = document.getElementById("recordingDuration");
    const duration = parseInt(durationInput.value, 10); // Parse the input value as an integer
    if (isNaN(duration) || duration <= 0) {
      // Handle invalid input
      alert("Please enter a valid recording duration (in seconds).");
      return;
    }

    // Start recording
    this.startRecording(event);

    // Set a timeout to stop recording after the specified duration
    setTimeout(() => {
      this.stopRecordingAndSaveLocally(event);
    }, duration * 1000); // Convert duration to milliseconds
  }

  stopRecordingAndSaveLocally(event) {
    this.stopRecording(event); // Stop the recording

    // Retrieve the recorded audio blob
    const audioBlob = this.audioBlobTarget.files[0];
    if (!audioBlob) {
      console.error("No audio blob found.");
      return;
    }

    // Create a new FileWriter object
    const fileWriter = new FileWriter();

    // Write the audio blob to a file
    fileWriter.write(audioBlob)
      .then(() => {
        // File successfully written
        console.log("Audio saved locally.");
      })
      .catch(error => {
        // Handle errors
        console.error("Error saving audio locally:", error);
      });
  }

  startRecording(event) {
    event.preventDefault()
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
      navigator.mediaDevices.getUserMedia({ audio: true }).then(stream => {
        this.recorder = RecordRTC(stream, {
          type: 'audio',
          getBlob: function () {
            return blobURL2;
          },
           getRealBlob: function() {
              return blobURL;
            },
        });
        this.startRecorder(event);
      }).catch((error) => {
        console.log("The following error occurred: " + error);
        alert("Please grant permission for microphone access")
      });
    } else {
      alert("Your browser does not support audio recording, please use a different browser or update your current browser")
    }
  }

  pauseRecording (event) {
    event.preventDefault();
    this.recorder.pauseRecording()
    this.startRecordingTarget.disabled = true
    this.pauseRecordingTarget.disabled = true;
    this.stopRecordingTarget.disabled = false
    this.resumeRecordingTarget.disabled = false;
    this.stopTimer();
  }

  resumeRecording (event) {
    event.preventDefault();
    this.recorder.resumeRecording()
    this.startRecordingTarget.disabled = true
    this.stopRecordingTarget.disabled = false
    this.pauseRecordingTarget.disabled = false;
    this.resumeRecordingTarget.disabled = true;
    this.startTimer();
  }

  startRecorder (event) {
    var vm = this;
    event.preventDefault();
    this.recorder.startRecording();
    this.startRecordingTarget.disabled = true
    this.stopRecordingTarget.disabled = false
    this.pauseRecordingTarget.disabled = false;

    this.startTimer();
  }


  stopRecording(event) {
    event.preventDefault()
    this.recorder.stopRecording(blob => {
      console.log(blob)
      // this.recordedAudioTarget.controls = true;
    });
    this.startRecordingTarget.disabled = false
    this.stopRecordingTarget.disabled = true
    this.pauseRecordingTarget.disabled = true;
    this.resumeRecordingTarget.disabled = true;
    triggerChange(this.element);
    this.stopTimer();
    this.secondsElapsed = 0;
  }


  blobToFile(theBlob, fileName){
      return new File([theBlob], fileName, { lastModified: new Date().getTime(), type: theBlob.type })
  }

  appendFormData (formData) {
    if (!this.recorder) return formData;
    var fieldName = this.audioBlobTarget.name;
    console.log('fieldName:', fieldName);

    if (this.recorder.getBlob())
      formData.append(fieldName, this.recorder.getBlob(), (new Date()).getTime() + ".webm");

    return formData;
  }

  openRecorder () {
    return (this.stopRecordingTarget.disabled == false);
  }

  startTimer () {
    var vm = this;
    this.timerInterval = setInterval(() => {
      vm.secondsElapsed = vm.secondsElapsed + 1;
      vm.setTime();
    }, 1000);
  }

  stopTimer () {
    var vm = this;
    clearInterval(vm.timerInterval);
  }

  setTime () {
    this.timeElapsedTarget.innerHTML = `Time Elapsed: ${this.getTimeString(this.secondsElapsed)} seconds  `;
  }

  getTimeString(seconds) {
    let hours = Math.floor(seconds / 3600);
    let minutes = Math.floor((seconds % 3600) / 60);
    let remainingSeconds = seconds % 60;

    // Add leading zeroes to hours, minutes, and seconds if needed
    hours = hours < 10 ? "0" + hours : hours;
    minutes = minutes < 10 ? "0" + minutes : minutes;
    remainingSeconds = remainingSeconds < 10 ? "0" + remainingSeconds : remainingSeconds;

    return `${hours}:${minutes}:${remainingSeconds}`;
  }
}