require 'spec_helper'


describe User do
  let!(:user) {FactoryGirl.create(:user)}

  it {should validate_presence_of(:full_name)}
  it {should validate_presence_of(:email)}
  it {should ensure_length_of(:username).is_at_least(5)}
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
end