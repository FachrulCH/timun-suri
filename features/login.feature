Feature: Login to Popoji
  As an admin, when I want to manage blog, I need to login to admin page 

Scenario: Invalid login username
  Given user is on login page
  When login as invalid username
  Then password field should not show up

Scenario: Invalid login password
  Given user is on login page
  When login as "admin" with password "12345678"
  Then show alert "Username or password not correct!"

Scenario: Succes login
  Given user is on login page
  When login as "admin" with password "admindemo"
  Then user should be redirected to admin dashboard page