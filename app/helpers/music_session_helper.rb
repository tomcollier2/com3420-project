module MusicSessionHelper
  def student_completed?(music_session, student_id)
    student_session = StudentSession.find_by(music_session: music_session, student_id: student_id)
    student_session ? student_session.completed : false
  end
end
