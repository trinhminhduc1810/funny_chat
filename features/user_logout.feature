@javascript
Feature: User logout
  As a user,
  I want to logout from my account

  Scenario: Logout successfully
    Given I have an account
    And I am on login page
    And I fill matched username and password
    When I press button "Login"
    And I press link "Log out"
    Then I should logout successfully
    And I should be on login page