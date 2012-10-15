require 'spec_helper'


describe User do
  let!(:user) {FactoryGirl.create(:user)}

  it {should validate_presence_of(:full_name)}
  it {should validate_presence_of(:email)}
  it {should ensure_length_of(:username).is_at_least(5)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_format_of(:email).with("abc").with_message("is invalid \"abc\"")}
  it {should validate_uniqueness_of(:email)}
  it {should validate_confirmation_of(:password)}
  it {should ensure_length_of(:password).is_at_least(7)}

  describe "user is valid" do
    it "with valid attributed" do
      user.should be_valid
    end
  end

  describe "encrypt user's password" do
    it "should encrypt the plain text password" do
      user.password.should_not == user.password_hash
    end
  end

  describe "authenticate user" do
    it "should return valid user with correct password" do
      result = User.authenticate(user.username,"password")
      result.should == user
    end
  end

  describe "get user friend list" do
    it "should return a friend list of user" do
       normal_user = FactoryGirl.create(:user, :normal_user)
       user.friend_lists.create(:friend_id => normal_user.id)
       result = user.user_friend_list
       result.count.should_not be_zero
       result.first.should eq normal_user
    end
  end
end