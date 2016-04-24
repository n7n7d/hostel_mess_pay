class Bill < ActiveRecord::Base

  before_create :set_amount
  belongs_to :resident
  validates :from_date,presence: true
  validates :to_date,presence: true
  validates :expiry_date,presence: true

  private

  def set_amount
    self.amount = (self.to_date - self.from_date).to_i * self.resident.hostel.rate_card.daily_diet
  end
end