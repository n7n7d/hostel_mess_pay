class Resident < ActiveRecord::Base

  after_create :create_account
  has_one :account,dependent: :delete
  belongs_to :hostel
  has_many :leaves,dependent: :delete_all
  has_one :user,dependent: :delete
  validates :room_number,presence: true,uniqueness: {case_sensitive: false}
  validates :roll_number,presence: true,uniqueness:{case_sensitive: false}
  validates :name, presence: true,length:{ maximum: 50 }

  private

  def create_account
     self.create_account=params[:account]
  end

end

