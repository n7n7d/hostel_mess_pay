class Hostel < ActiveRecord::Base
  has_many :residents
  has_one :rate_card,dependent: :delete
  def to_s
    "#{hostel}"
  end
end
