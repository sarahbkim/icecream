# app/serializers/task_serializer.rb
class IcecreamShopSerializer < ActiveModel::Serializer
  attributes :id, :factual_id, :name, :street_address, :city, :state, :zipcode
end