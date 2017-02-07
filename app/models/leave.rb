class Leave < ActiveRecord::Base
  belongs_to :resident

  default_scope -> { order(created_at: :desc) }

  validates :destination,presence:true
  validates :end_date,presence: true
  validates :start_date,presence: true
  validate :check_correct_leave, :check_leaves_in_same_month

  private

  def check_correct_leave
    if resident.hostel.hostel=='J' and ![5,4].include?((self.end_date - self.start_date).to_i)
      errors.add(:base,"Leaves are granted only for 4 or 5 days in hostel J")
    end
  end

  def check_leaves_in_same_month
    if self.resident.leaves.where('start_date > ?', self.start_date.beginning_of_month).any?
      errors.add(:base,"You can't mark leave cause you have already marked leave for this month")
    end
  end

  def update_account
    @account=Account.find_by(resident_id:self.resident_id)
    @account.update_attribute(leaves: (self.end_date - self.start_date).to_i)
  end
end
