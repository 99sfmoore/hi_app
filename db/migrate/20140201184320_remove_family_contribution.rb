class RemoveFamilyContribution < ActiveRecord::Migration
  def change
    remove_column :semester_packages, :family_contribution
  end
end
