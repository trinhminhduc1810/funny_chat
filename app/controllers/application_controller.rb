class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
    unless session[:user]
      redirect_to session_new_path, :notice => "you need to login to access this page"
      return false
    else
      @current_user = User.find_by_username(session[:user])
      return true
    end
  end

  def save_login_state
     if session[:user]
       redirect_to chat_main_path
       return false
     else
       return true
     end
  end
end
