class FaPackage < ActiveRecord::Base
  has_one :student
  belongs_to :school
  has_many :semester_packages
end
