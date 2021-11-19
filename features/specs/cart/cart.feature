@full_regression
@cart
Feature: Cart features
  I would like to be able to login on the application
  As a common user
  So I can navigate and buy stuff

Background: Starts on the cart logged in and with a product
  Given is logged in with the user "valid_cart_login" and with a product on the shopping cart
  And is on the shopping cart

@exclude_product_from_cart
Scenario: Exclude product from the cart
  When exclude the product from the shopping cart
  Then the cart should be empty

@increase_product_quantity_cart
Scenario: Increase product quantity
  When increase the product quantity
  Then the product quantity should be increased

@decrease_product_quantity_cart
Scenario: Decrease product quantity
  When decrease the product quantity
  Then the cart should be empty

@continue_shopping_cart
Scenario: Continue shopping
  When continue shopping
  Then should go back to the search page

@proceed_to_checkout_cart
Scenario: Proceed to checkout
  When proceed with the checkout
  Then the address page should be displayed
  