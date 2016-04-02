class Resident < ActiveRecord::Base

  belongs_to  :hostel

  has_one :user,dependent: :destroy

  validates :room_number,presence: true,uniqueness: {case_sensitive: false}
  validates :roll_number,presence: true,uniqueness:{case_sensitive: false}
  validates :name, presence: true,length:{ maximum: 50 }

end

