class Api::V1::BidsController < Api::BaseController

  def create
    byebug
    bid = Bid.new(bid_params)
    bid.user = current_user
    auction_id = bid.auction

    if bid.save
      render json: bid.auction
    else
      render json: { error: bid.errors.full_messages }
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid, :auction_id)
  end
end
