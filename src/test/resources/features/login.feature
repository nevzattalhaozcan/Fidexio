@smoke @regression @FIDEX10-395
Feature: Login Functionality

  #User Story : As a user, I should be able to log in so that I can land on homepage.
  #Acceptance Criteria:
  #1- Users can log in with valid credentials (We have 5 types of users but will test only 2 user: PosManager, SalesManager)
  #2- "Wrong login/password" should be displayed for invalid (valid username-invalid password and invalid username-valid password) credentials
  #3- "Please fill out this field" message should be displayed if the password or username is empty
  #4- User land on the ‘reset password’ page after clicking on the "Reset password" link
  #5- User should see the password in bullet signs by default
  #6- Verify if the ‘Enter’ key of the keyboard is working correctly on the login page.


  Background: Login page
    Given User is on the login page

  @FIDEX10-388
  Scenario Outline: Users can log in with valid credentials
    When User enters an email "<email>"
    And User enters a password "<password>"
    And User clicks login button
    Then User should be on the homepage

    Examples: Valid Credentials
      | email                    | password     |
      | salesmanager6@info.com   | salesmanager |
      | salesmanager100@info.com | salesmanager |
      | posmanager53@info.com    | posmanager   |
      | posmanager100@info.com   | posmanager   |

  @FIDEX10-390
  Scenario Outline: "Wrong login/password" should be displayed for invalid credentials
    When User enters an email "<email>"
    And User enters a password "<password>"
    And User clicks login button
    Then User should see the error message

    Examples: Invalid Credentials
      | email                    | password     |
      | salesmanage6@info.com    | salesmanager |
      | salesmanager100@info.com | salesmanage  |
      | posmanager1@info.com     | posmanager   |
      | posmanager100@info.com   | pomanager    |

  @FIDEX10-391
  Scenario Outline: "Please fill out this field" message should be displayed for empty fields
    When User enters an email "<email>"
    And User enters a password "<password>"
    And User clicks login button
    Then User should see the required message

    Examples: Email and Password with some empty fields
      | email                    | password     |
      |                          | salesmanager |
      | salesmanager100@info.com |              |

  @FIDEX10-392
  Scenario: User lands on the ‘reset password’ page after clicking on the "Reset password" link
    When User clicks reset password link
    Then User lands on the reset password page

  @FIDEX10-393
  Scenario: User should see the password in bullet signs by default
    When User enters a password "salesmanager"
    Then User sees the password in bullet sign

  @FIDEX10-394
  Scenario: ‘Enter’ key of the keyboard is working correctly on the login page
    When User enters an email "salesmanager44@info.com"
    And User enters a password "salesmanager"
    And User presses enter key
    Then User should be on the homepage
