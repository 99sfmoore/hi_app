class Student < ActiveRecord::Base
  has_many :semester_packages, order: "ordering ASC"

  def full_name
    first_name+" "+last_name
  end
end
