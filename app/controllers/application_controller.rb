class ApplicationController < ActionController::Base
  before_action :api_request
  helper_method :current_user


  def api_request
    @search = TmdbSearch.new
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      flash[:error] = "Sorry, you must be logged in."
      redirect_to root_path
    end
  end

end
