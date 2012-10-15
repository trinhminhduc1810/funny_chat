@javascript
Feature: User add new friend
  As an user,
  I want to add new friend

  Background:
    Given I am on login page
    And I have an account
    And System has another an account
    And I fill matched username and password
    And I press button "Login"

  Scenario Outline:
    And I fill "friend_username" with "<content>"
    When I press button "Add Friend"
    Then I should receive alert message: "<message>"

   Scenarios: add new friend
    | content      | message                 |
    | username1    | Friend added            |
    | no-user      | Friend not found        |
    | ty_edge_540t | You cannot add yourself |

