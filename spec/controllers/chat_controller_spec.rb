require "spec_helper"
describe ChatController do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:normal_user) {FactoryGirl.create(:user,:normal_user)}

  before(:each) do
    session[:user] = user.username
  end

  describe "add new friend" do
    it "should add new friend successfully with correct friend's username" do
      post :add_friend, :username => normal_user.username
      user.friend_lists.count.should == 1
    end

    it "should not add new friend successfully with non-exist friend's username" do
      post :add_friend, :username => "abc"
      user.friend_lists.count.should == 0
    end

    it "should not add friend twice" do
      (0..1).each do
        post :add_friend, :username => normal_user.username
      end
      user.friend_lists.count.should == 1
    end

    it "should not add itself as friend" do
      post :add_friend, :username => user.username
      user.friend_lists.count.should == 0
    end
  end

end