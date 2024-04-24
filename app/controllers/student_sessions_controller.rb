class StudentSessionsController < ApplicationController
  def new
    #gets the session from url and creted new studentsession form
    @music_session = MusicSession.find(params[:music_session_id])
    @student_session = @music_session.student_sessions.new

    #list of all students belonging to the tutor
    @students = current_tutor.students
    #list of all students that are already added to the MusicSession
    @associated_students = @music_session.student_sessions.map(&:student)

    @available_students = @students - @associated_students
  end

  def create
    @music_session = MusicSession.find(params[:music_session_id])

    if @music_session.tutor_id != current_tutor.id
      redirect_to music_sessions_path, alert: "You don't have permission to add students to this session."
      return
    end

    student_ids = params[:student_session][:student_id]

    student_ids.each do |student_id|
      StudentSession.create!(music_session_id: @music_session.id, student_id: student_id, completed: false) if student_id != ""
    end

    redirect_to @music_session, notice: 'Students were successfully added to the session.'
  end
end
