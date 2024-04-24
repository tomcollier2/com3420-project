class MusicSessionsController < ApplicationController
  before_action :set_session, only: %i[ show destroy edit update ]

  def index
    if tutor_signed_in?
      @sessions = MusicSession.where(tutor_id: current_tutor.id)
      @tasks = Task.all
    elsif student_signed_in?
      @sessions = current_student.music_sessions
      @tasks = Task.all
    end
  end

  def new
    @session = MusicSession.new
  end

  def create
    @session = MusicSession.create(title: session_params["title"], description: session_params["description"], due_date: session_params["due_date"], tutor_id: current_tutor.id)
    puts session_params["due_date"]
    if @session.save
      redirect_to music_sessions_path, notice: "session was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
    redirect_to music_sessions_url, notice: "session was successfully destroyed.", status: :see_other
  end

  def edit

  end

  def update
    if @session.update(session_params)
      redirect_to music_sessions_path, notice: "Session was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @tasks = Task.where(music_session_id: params[:id])
    @students = @session.students
  end

  private
  def set_session
    @session = MusicSession.find(params[:id])
  end

    def session_params
      params.require(:music_session).permit(:title, :description, :due_date)
    end
end