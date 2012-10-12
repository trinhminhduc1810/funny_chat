@javascript
Feature: Create new user
  As a guest,
  I want to create new user account

  Background:
    Given I am on login page
    And I press link "Sign Up"


  Scenario: Create new user account successfully
    And I provide correct information
    When I press button "Create User"
    Then I should create new user account successfully
    And I should be on login page

  Scenario Outline: Create new user account unsuccessfully
    And I fill "<field>" with "<content>"
    When I press button "Create User"
    Then I should not create new user account successfully
    And I should receive message: "<message>"

    Scenarios: Create with invalid field
      | field                      | content | message                                         |
      | user_full_name             |         | Full name can't be blank                        |
      | user_email                 | abc     | Email is invalid                                |
      | user_username              | abc     | Username is too short (minimum is 5 characters) |
      | user_password              | abc     | Password is too short (minimum is 7 characters) |
      | user_password_confirmation | bca     | Password doesn't match confirmation             |
