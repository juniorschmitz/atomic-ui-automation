@full_regression
@login
Feature: Login on the Fake Ecommerce
  I would like to be able to login on the application
  As a common user
  So I can navigate and buy stuff

Background: Starts on the Login Page
  Given access the login page

@login_successfuly
Scenario: Login Successfuly
  When login with the user "valid_login"
  Then should log in successfully

@login_unsuccessfuly
Scenario: Invalid Login
  When login with the user "invalid_login"
  Then the login should fail
