class User < ActiveRecord::Base
  before_save -> do
    self.uid = SecureRandom.uuid
    skip_confirmation!
  end
  
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  
  include DeviseTokenAuth::Concerns::User
  
  has_many :check_ins
  has_many :favorite_shops

  
end
