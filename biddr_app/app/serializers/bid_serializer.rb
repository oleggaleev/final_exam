class BidSerializer < ActiveModel::Serializer
  attributes :id, :bid, :created_at, :user
  belongs_to :user
  belongs_to :auction
end
