class BidSerializer < ActiveModel::Serializer
  attributes :id, :bid, :user
  belongs_to :user

end
