class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :icecream_shop
  
  validates :user_id, presence: true
  validates :shop_id, presence: true, uniqueness: true
  validates :user_name, presence: true
end
