@full_regression
@register
Feature: Registration on the Fake Ecommerce
  I would like to be able to register on the application
  As a common user
  So I can navigate and buy stuff

@register_new_user
Scenario: Registration successfuly
  Given access the login page
  When select the registration option
  And register a new user with valid data
  Then should log in successfully
