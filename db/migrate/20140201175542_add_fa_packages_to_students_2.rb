class AddFaPackagesToStudents2 < ActiveRecord::Migration
  def change
    add_column :students, :fa_package_id, :integer
  end
end
