class Hostel < ActiveRecord::Base
  has_many :residents
  def to_s
    "#{hostel}"
  end
end
