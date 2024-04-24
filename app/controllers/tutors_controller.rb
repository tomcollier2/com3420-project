class TutorsController < ApplicationController
    #needs to be changed to use cancancan
    before_action :authenticate_tutor!

    before_action :set_tutor, only: %i[ show destroy edit update ]
  
    def index
      @tutors = Tutor.all
    end

    def new
      @tutor = Tutor.new
    end
  
    # POST /products
    def create
      @tutor = Tutor.new(tutor_params)
  
      if @tutor.save
        redirect_to tutors_path, notice: "tutor was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      @tutor.destroy
      redirect_to tutors_url, notice: "tutor was successfully destroyed.", status: :see_other
    end

    def edit

    end

    def update
      if @tutor.update(tutor_params)
        redirect_to tutors_path, notice: "Tutor was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_tutor
          @tutor = Tutor.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def tutor_params
          params.require(:tutor).permit(:tutorID, :forename, :surname, :email, :password, :admin)
        end
end
  