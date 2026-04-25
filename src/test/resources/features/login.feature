Feature: User Login

  Scenario: Valid user can log in
    Given the user is on the login page
    When they submit valid credentials
    Then they land on the dashboard
