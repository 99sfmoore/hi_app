class AddOrderToPackages < ActiveRecord::Migration
  def change
    add_column :semester_packages, :ordering, :integer
  end
end
