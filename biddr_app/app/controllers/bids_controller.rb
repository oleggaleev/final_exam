class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_auction, only: [:create]
  before_action :find_bid, only: [:destroy]
  before_action :authorize_user!, except: [:create]

  def create
    @bid = @auction.bids.build(bid_params)

    @bid.user = current_user

    if @bid.save
      redirect_to auction_path(@auction)
    else
      @bids = @auction.bids.order(created_at: :desc)
      render 'auctions/show'
    end
  end

  def destroy
    @bid.destroy
    redirect_to auction_path(@bid.auction)
  end

  private
  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

  def find_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:bid)
  end

  def authorize_user!
    unless can?(:manage, @bid)
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end
end
