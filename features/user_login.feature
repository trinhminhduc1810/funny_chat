@javascript
Feature: User login into chat application
  As a user,
  I want to login into chat application

  Background:
    Given I am on login page
    And I have an account

  Scenario: Login successfully with correct username and password
    And I fill matched username and password
    When I press button "Login"
    Then I should login successfully
    And I should be on main page

  Scenario: Login unsuccessfully with wrong username and password
    And I fill wrong username and password
    When I press button "Login"
    Then I should not login successfully
    And I should be on login page