class TasksController < ApplicationController

  def new
    @music_session = MusicSession.find(params[:music_session_id])
    if @music_session.tutor_id == current_tutor.id
      @task = Task.new
    else
      redirect_to music_sessions_path, notice: "invalid session"
    end
  end

  # POST /products
  def create
    @music_session = MusicSession.find(params[:music_session_id])
    @task = Task.create(title: task_params["title"], description: task_params["description"], reward: task_params["reward"], practice_time: task_params["practice_time"], record_time: task_params["record_time"], music_session_id: @music_session.id)
    if @task.save
      redirect_to music_session_path(@music_session), notice: "task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :reward, :practice_time, :record_time)
    end


end