Feature: Authentication feature

  Scenario: Successfull reader login
    Given I am a guest
    And Reader with "alba@gmail.com" exists
    When I fill the login form with valid data for "alba@gmail.com" reader
    Then I should be logged in as "alba@gmail.com" reader

  Scenario: Logout
    Given I am 'reader01@email.com' reader
    When I go to logout page
    Then I should be logged out
