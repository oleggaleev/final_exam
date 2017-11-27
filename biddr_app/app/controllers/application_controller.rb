class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
    # The following is to prevent the app from crashing if we have
    # `user_id` in the session with no corresponding user in the database.
    # This can happen when that user is deleted.
    if session[:user_id].present? && current_user.nil?
      session[:user_id] = nil
    end
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    # We detect a logged in user by their being a `user_id` in the session.
    # The `session` is global object available in our controllers & views
    # that contains data persisted accross requests per client (i.e. browser).
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
  # `helper_method` makes a controller method available in all our views

  private
  def authenticate_user!
    if !user_signed_in?
      redirect_to new_session_path, alert: 'You must sign in or sign up first!'
    end
  end
end
