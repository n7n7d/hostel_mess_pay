class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  validates :hostel, inclusion: { in: %w(j a b c h pg),
                                message: "%{value} is not a valid hostel" }
end
