Given /^System has another an account$/ do
  FactoryGirl.create(:user, :normal_user)
end

Then /^I should receive alert message: "(.*?)"$/ do |message|
  sleep(1)
  alert = page.driver.browser.switch_to.alert
  alert.text.should == message
  alert.accept
end