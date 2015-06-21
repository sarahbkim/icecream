class CheckInsSerializerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :shop_id, :created_at
end
