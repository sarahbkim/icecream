class User < ActiveRecord::Base
  has_many :favorite_shops
  has_many :check_ins

  has_many :checkins, through: :check_ins, source: :icecream_shop
  has_many :favorites, through: :favorite_shops, source: :icecream_shop

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
