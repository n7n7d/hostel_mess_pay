class Resident < ActiveRecord::Base
  validates :room_number,presence: true,uniqueness: {case_sensitive: false}
  validates :roll_number,presence: true,uniqueness:{case_sensitive: false}
  validates :name, presence: true,length:{ maximum: 50 }
  validates :hostel,presence: true,inclusion:{:in =>['a' 'b' 'c' 'h' 'pg' 'j' 'frc' 'e' 'g' 'i'],message: "%{value} is not a valid hostel"}
  before_validation :downcase_hostel

  private
  def downcase_hostel
    self.hostel = self.hostel.downcase if self.hostel.present?
  end
end

