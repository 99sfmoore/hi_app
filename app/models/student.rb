class Student < ActiveRecord::Base
  has_many :fa_offers

  def full_name
    first_name+" "+last_name
  end
end
