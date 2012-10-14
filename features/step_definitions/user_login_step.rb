
Given /^I have an account$/ do
  @user = FactoryGirl.create(:user)
end

Given /^I fill matched username and password$/ do
  fill_in "username", :with => @user.username
  fill_in "password",  :with => @user.password
end

Then /^I should login successfully$/ do
  page.should have_content("Login successfully")
end

Then /^I should be on main page$/ do
  current_path.should == chat_main_path
end

Given /^I fill wrong username and password$/ do
  fill_in "username", :with => "abc"
  fill_in "password", :with => "abc"
end

Then /^I should not login successfully$/ do
  page.should have_content("Wrong username or password")
end
