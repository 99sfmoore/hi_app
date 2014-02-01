class CreateFaOffers < ActiveRecord::Migration
  def change
    create_table :fa_offers do |t|
      t.integer :student_id
      t.integer :school_id
      t.timestamps
    end
  end
end
