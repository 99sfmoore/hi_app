class AddStudentIdToSemesterPackages < ActiveRecord::Migration
  def change
    add_column :semester_packages, :student_id, :integer
  end
end
