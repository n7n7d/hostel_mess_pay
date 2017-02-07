class Bill < ActiveRecord::Base
  after_update :update_account
  before_create :set_amount
  belongs_to :resident
  validates :from_date,presence: true
  validates :to_date,presence: true
  validates :expiry_date,presence: true
  default_scope -> { order(created_at: :desc) }
  private

  def set_amount
    self.amount = (self.to_date - self.from_date).to_i * self.resident.hostel.rate_card.daily_diet
  end
  def update_account
    @account=Account.find_by(resident_id:self.resident_id)
    @account.update_attributes(last_month_adjustment:(self.amount- self.paid_amount),leaves: 0,fine:0)
  end
end

