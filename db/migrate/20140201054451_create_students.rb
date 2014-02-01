class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :ssn
      t.string :first_name
      t.string :last_name
      t.string :status
      t.timestamps
    end
  end
end
