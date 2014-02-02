class CreateSemesterPackages < ActiveRecord::Migration
  def change
    create_table :semester_packages do |t|
      t.integer :fa_package
      t.string :semester_name
      t.float :tuition_and_fees
      t.float :housing_meals
      t.float :books
      t.float :transportation
      t.float :other
      t.float :school_grant
      t.float :pell
      t.float :state_grant
      t.float :other_scholarship
      t.float :work_study
      t.float :perkins
      t.float :sub_stafford
      t.float :unsub_stafford
      t.float :family_contribution
      t.timestamps
    end
  end
end
