require 'spec_helper'

describe UsersController do
  before (:each) do
    @attr = FactoryGirl.attributes_for(:user)
    @invalid_attr = FactoryGirl.attributes_for(:user, :invalid_user)
  end

  describe "Create New User" do
    it "should create user successfully with valid infor" do
      post :create, :user => @attr
      flash[:notice].should == "User was successfully created."
      response.should redirect_to(session_new_path)
    end

    it "should not create user with invalid infor" do
      post :create, :user => @invalid_attr
      response.should_not redirect_to(session_new_path)
    end


  end

end