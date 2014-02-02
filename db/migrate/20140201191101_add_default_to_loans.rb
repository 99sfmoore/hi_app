class AddDefaultToLoans < ActiveRecord::Migration
  def change
    change_column :semester_packages, :school_grant, :float, :default => 0
    change_column :semester_packages, :pell, :float, :default => 0
    change_column :semester_packages, :state_grant, :float, :default => 0
    change_column :semester_packages, :other_scholarship, :float, :default => 0
    change_column :semester_packages, :work_study, :float, :default => 0
    change_column :semester_packages, :perkins, :float, :default => 0
    change_column :semester_packages, :sub_stafford, :float, :default => 0
    change_column :semester_packages, :unsub_stafford, :float, :default => 0
  end
end
