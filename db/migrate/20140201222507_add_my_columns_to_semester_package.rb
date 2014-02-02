class AddMyColumnsToSemesterPackage < ActiveRecord::Migration
  def change
    add_column :semester_packages, :my_housing, :float
    add_column :semester_packages, :my_books, :float
    add_column :semester_packages, :my_transportation, :float
    add_column :semester_packages, :my_other, :float
    add_column :semester_packages, :my_other_scholarship, :float
    add_column :semester_packages, :my_work_study, :float
    add_column :semester_packages, :my_family_contribution, :float
  end
end
