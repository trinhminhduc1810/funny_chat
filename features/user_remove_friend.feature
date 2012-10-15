@javascript
Feature: Remove friend from list
  As a user,
  I want to remove a friend from my friend list

  Scenario: Remove friend from list successfully
    Given I am on login page
    And I have an account
    And System has another an account
    And I fill matched username and password
    And I press button "Login"
    And I added another user as my friend
    When I remove that user from my friend list
    Then I should receive message: "Removed username1 from your friend list"
    And I should not see that user in my friend list