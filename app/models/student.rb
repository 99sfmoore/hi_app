class Student < ActiveRecord::Base
  has_many :fa_offers
  # belongs_to :fa_package
  has_many :semester_packages

  def full_name
    first_name+" "+last_name
  end
end
