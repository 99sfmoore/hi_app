class AddCollegeNameToSemesterPackage < ActiveRecord::Migration
  def change
    add_column :semester_packages, :college_name, :string
  end
end
