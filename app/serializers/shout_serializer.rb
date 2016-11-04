class ShoutSerializer < ActiveModel::Serializer
  attributes :body
  has_one :user
end
