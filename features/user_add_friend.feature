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

  Scenario: add friend successfully
    And I fill "friend_username" with "username1"
    When I press button "Add Friend"
    Then I should receive alert message: "Friend added"
    And I should see my friend's username on main page

  Scenario: add duplicated friend
    And I fill "friend_username" with "username1"
    And I press button "Add Friend"
    And I turn off the alert
    When I fill "friend_username" with "username1"
    And I press button "Add Friend"
    Then I should receive alert message: "You added username1 already!"

  Scenario Outline:
    And I fill "friend_username" with "<content>"
    When I press button "Add Friend"
    Then I should receive alert message: "<message>"

   Scenarios: add new friend
    | content      | message                 |
    | no-user      | Friend not found        |
    | ty_edge_540t | You cannot add yourself |

