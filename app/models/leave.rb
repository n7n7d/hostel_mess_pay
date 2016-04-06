class Leave < ActiveRecord::Base
  belongs_to :resident
  validates :destination,presence:true
  validates :end_date,presence: true
  validates :start_date,presence: true
  before_create :check_correct_leave

  private

  def check_correct_leave

   if resident.hostel.hostel=='J'
     (self.end_date - self.start_date).to_i == 4 ||  (self.end_date - self.start_date).to_i == 5

   else
     errors.add(:start_date, "Leave not granted only 4 or 5 days")
   end

  end

end
