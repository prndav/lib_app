Feature: Top menu

  On any page user of the application must see the menu with links.
  Guest user sees links to Registration form and login
  Reader sees his email, Account link and Logout link
  Admin sees the same thing the reader does, but also the link to admin panel

  Scenario: Guest user
    Given I am a guest
    When I go to home page as guest
    Then I should see guest menu

  Scenario: Reader
    Given I am a "porna@gmail.com" reader
    When I go to home page as reader
    Then I should see "porna@gmail.com" reader menu
