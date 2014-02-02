
class SemesterPackagesController < ApplicationController

  def new
    @semester_package = SemesterPackage.new
    @student = Student.find(params[:student_id])
  end

  def create
    @student = Student.find(params[:student_id])
    @p = @student.semester_packages.build(semester_package_params)
    @p.set_my_variables
    @student.save
    redirect_to student_semester_package_path(@student, @p)
  end

  def show
    @package = SemesterPackage.find(params[:id])
    @student = Student.find(params[:student_id])
  end

  def update
    @package = SemesterPackage.find(params[:id])
    @student = Student.find(params[:student_id])
    @package.update_attributes(my_housing: params[:my_housing],
                              my_books: params[:my_books],
                              my_transportation: params[:my_transportation],
                              my_other: params[:my_other],
                              my_other_scholarship: params[:my_other_scholarship],
                              my_work_study: params[:my_work_study],
                              my_family_contribution: params[:my_family_contribution],
                              )

   redirect_to student_semester_package_path(@student, @package)
  end

  def four_year_cost
    @package = SemesterPackage.find(params[:id])
    @student = Student.find(params[:student_id])
  end



  # # ajax version????
  # def my_coa
  #   @package = SemesterPackage.find(params[:id])
  #   @package.tuition_and_fees + params[:my_housing] + params[:my_books] + params[:my_transportation] + params[:my_other]
  # end


  private
    def semester_package_params
      params.require(:semester_package).permit(:college_name,
                                                          :tuition_and_fees,
                                                          :housing_meals,
                                                          :books,
                                                          :transportation,
                                                          :other,
                                                          :pell,
                                                          :state_grant,
                                                          :other_scholarship,
                                                          :work_study,
                                                          :perkins,
                                                          :sub_stafford,
                                                          :unsub_stafford)
    end
end

 
    