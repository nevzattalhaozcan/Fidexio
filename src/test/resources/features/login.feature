
Feature: Login Functionality

  Background: Login page
    Given User is on the login page

  Scenario Outline: Login with valid credentials
    When User enters valid email "<email>"
    And User enters valid password "<password>"
    And User clicks login button
    Then User should be on the homepage

    Examples: Email and Password
      | email                    | password     |
      | salesmanager6@info.com   | salesmanager |
      | salesmanager100@info.com | salesmanager |
      | posmanager53@info.com    | posmanager   |
      | posmanager100@info.com   | posmanager   |

