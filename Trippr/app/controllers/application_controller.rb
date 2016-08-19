class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # add "before_filter :authorize" to controllers where we want to force users to login before they can see the actions in this controller
  def current_user
    # This will return the actual instance of user without showing password attr. Associations works for this instance.
    @current_user ||= User.where(id: session[:user_id]).select(:id, :username).take if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end
end
