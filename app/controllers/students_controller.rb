class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to @student
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
  end

  private
    def student_params
      params.require(:student).permit(:ssn,
                                      :first_name,
                                      :last_name,
                                      :status,
                                      :email)
    end
end
