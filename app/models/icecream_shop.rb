class IcecreamShop < ActiveRecord::Base
  has_many :favorite_shops
  has_many :check_ins

  has_many :checkin_by, through: :check_ins, source: :user
  has_many :favorited_by, through: :favorite_shops, source: :user

  VALID_ZIPCODE_REGEX = /^\d{5}(-\d{4})?$/
  validates :id, uniqueness: true
  validates :factual_id, uniqueness: true, presence: true
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true, format: { with: VALID_ZIPCODE_REGEX, multiline: true } # should be in the form 12345 or 12345-1234
end
