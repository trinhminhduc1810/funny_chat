Given /^System has another an account$/ do
  FactoryGirl.create(:user, :normal_user)
end

Given /^I turn off the alert$/ do
  sleep(1)
  alert = page.driver.browser.switch_to.alert
  alert.accept
end

Then /^I should see my friend's username on main page$/ do
  page.should have_content("username1")
end



Then /^I should receive alert message: "(.*?)"$/ do |message|
  sleep(1)
  alert = page.driver.browser.switch_to.alert
  alert.text.should == message
  alert.accept
end