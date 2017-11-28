class Ability
  include CanCan::Ability

  def initialize(user)
    # The `user` argument to initialize will generally be `current_user`
    # if you've defined it in your controller
    # (see Awesome Answer's ApplicationController.)

    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)


    alias_action :create, :read, :update, :destroy, :to => :crud

    can :crud, Auction do |auction|
      auction.user == user
    end

    can :manage, Bid do |bid|
      bid.user == user
    end

  end
end
