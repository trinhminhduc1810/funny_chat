Given /^I added another user as my friend$/ do
  fill_in "friend_username", :with => "username1"
  click_button "Add Friend"
  sleep(1)
  alert = page.driver.browser.switch_to.alert
  alert.accept
end

When /^I remove that user from my friend list$/ do
  within("ul#friend_list") do
    click_link "remove"
  end
end

Then /^I should not see that user in my friend list$/ do
  within("ul#friend_list") do
    page.should_not have_content("username1")
  end
end
