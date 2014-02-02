class AddFaPackageToStudents < ActiveRecord::Migration

  def change
    remove_column :fa_packages, :student_id
  end
end
