Given /^I am on login page$/ do
  visit(session_new_path)
end

Given /^I press link "(.*?)"$/ do |link_name|
  click_link(link_name)
end

When /^I provide correct information$/ do
  user_attr = FactoryGirl.attributes_for(:user)
  fill_sign_up_form(user_attr)
end

Given /^I fill "(.*?)" with "(.*?)"$/ do |field, content|
  fill_in "#{field}", :with => content
end

When /^I press button "(.*?)"$/ do |button_name|
  click_button(button_name)
end


Then /^I should create new user account successfully$/ do
  User.count.should == 1
  page.should have_content("User was successfully created.")
end

Then /^I should not create new user account successfully$/ do
  User.count.should be_zero
end


Then /^I should receive message: "(.*?)"$/ do |message|
  page.should have_content("#{message}")
end


Then /^I should be on login page$/ do
  current_path.should == session_new_path
end

