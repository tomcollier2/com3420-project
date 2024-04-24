class StudentsController < ApplicationController
  #need to be changed to use cancancan
  before_action :authenticate_tutor!
  before_action :set_student, only: %i[ show destroy edit update ]

  def index
    if params[:status] == "personal"
      @students = current_tutor.students
    else
      if current_tutor.admin?
        @students = Student.all
      else
        redirect_to dashboard_path, notice: 'you do not have access to that'
        end
    end
  end

  def new
    @student = Student.new
  end

  # POST /products
  def create
    @student = Student.new(student_params.except(:instruments))
    if @student.save
      instrument = current_tutor.instruments.create(instrument: student_params["instruments"]["instrument"], student: @student)
      redirect_to students_path, notice: "student was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @instrument = Instrument.find_by(student_id: @student.id)
    @instrument.destroy if @instrument != nil
    @student.destroy
    if params[:status] == "personal"
      redirect_to 'students?status=personal', notice: "student was successfully destroyed.", status: :see_other
    else
      redirect_to students_path, notice: "student was successfully destroyed.", status: :see_other
    end
  end

  def edit

  end

  def update
    if @student.update(student_params)
      redirect_to students_path, notice: "Student was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
      def set_student
        @student = Student.find(params[:id])
      end

      def student_params
        params.require(:student).permit(:forename, :surname, :email, :password, instruments: [:instrument])
      end

end