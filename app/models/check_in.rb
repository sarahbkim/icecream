class CheckIn < ActiveRecord::Base
  validates :user_id, presence: true
  validates :shop_id, presence: true, uniqueness: true
  validates :user_name, presence: true
end
