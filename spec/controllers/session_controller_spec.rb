require "spec_helper"
describe  SessionController do
  let!(:user) {FactoryGirl.create(:user)}

  describe "login into chat page" do
    it "should login successfully with correct username and password" do
      post :login, :username => user.username, :password => user.password
      flash[:notice].should == "Login successfully"
      response.should redirect_to chat_main_path
    end
    it "should not login successfully with wrong username and password" do
      post :login, :username => "abc", :password => "abc"
      flash[:notice].should == "Wrong username or password"
      response.should redirect_to session_new_path
    end

    it "should redirect to chat page if user has logged in already" do
      session[:user] = user.username
      get :new
      response.should redirect_to chat_main_path
    end

    it "should redirect to login page if user access to chat page without login" do
      get :logout
      flash[:notice].should == "you need to login to access this page"
      response.should redirect_to session_new_path
    end
  end

  describe "logout from chat page" do
    it "should logout successfully from chat page" do
      session[:user] = user.username
      get :logout
      flash[:notice].should == "Logout successfully"
      response.should redirect_to session_new_path
    end
  end

end