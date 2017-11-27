class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :endson, :price, :bids, :user

    has_many :bids
    belongs_to :user
    
    def created_at
        object.created_at.strftime('%Y-%B-%d')
    end

end
