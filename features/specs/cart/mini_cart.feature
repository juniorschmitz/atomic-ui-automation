@full_regression
@mini_cart
Feature: Mini Cart features
  I would like to be able to login on the application
  As a common user
  So I can navigate and buy stuff

Background: Starts logged in on the Home Page with a product added to the cart
  Given is logged in with the user "valid_login" and with a product on the shopping cart

@exclude_product_mini_cart
Scenario: Exclude a product from the mini cart
  When exclude the product from the mini cart
  Then there should be 0 products on the mini cart

@proceed_to_checkout_mini_cart
Scenario: Proceed to Checkout from the mini cart
  When proceed to checkout from the mini cart
  Then the checkout product overview page should be displayed
