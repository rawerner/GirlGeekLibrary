Feature: Create a book
  In order to share my books
  As an girl geek library user
  I want to add a book to the shelf

  Scenario: Not being logged in
    When I go to the homepage
    Then I should see "Sign in or Sign up"

  Scenario: Logged in users aren't prompted to log in
    Given I'm signed in as "rachel"
    Then I should not see "Sign in or Sign up"
