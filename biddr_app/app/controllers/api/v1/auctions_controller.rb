class Api::V1::AuctionsController < Api::BaseController
  before_action :authenticate_api_user

  def index
    @auctions = Auction.order(created_at: :desc).limit(20)
    # render json: @auctions

    # this will render views/api/v1/index.json.jbuilder
  end

  def show
    auction = Auction.find params[:id]
    # Because we installed ActiveModel Serializer then the default behaviour is
    # to use the serializer instead of the default `to_json` method that comes
    # with ActiveRecrod
    render json: auction
  end

  def create
    auction = Auction.new auction_params
    auction.user = current_user
    if auction.save
      render json: auction
    else
      render json: { errors: auction.errors.full_messages }
    end
  end

  def update
    auction = Auction.find params[:id]
    if auction.update auction_params
      render json: { success: true }
    else
      render json: { errors: auction.errors.full_messages }
    end
  end

  def destroy
    auction = Auction.find_by_id params[:id]
    if auction
      auction.destroy
      render json: { success: true }
    else
      render json: { errors: ['auction doesn\'t exist'] }
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :endson, :price)
  end
end
