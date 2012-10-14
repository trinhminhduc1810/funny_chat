class SessionController < ApplicationController

  before_filter :save_login_state, :only => [:login, :new]
  before_filter :authenticate_user, :only => [:logout]

  def new
  end

  def login
    if User.authenticate(params[:username],params[:password])
       session[:user] = params[:username]
       redirect_to chat_main_path, :notice => "Login successfully"
    else
       redirect_to session_new_path, :notice => "Wrong username or password"
    end
  end

  def logout
    session[:user] = nil
    redirect_to session_new_path, :notice => "Logout successfully"
  end
end
