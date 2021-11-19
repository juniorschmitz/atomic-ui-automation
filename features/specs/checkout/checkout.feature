@full_regression
@checkout
Feature: Checkout flows on the Fake Ecommerce
  As a site administrator
  I would like to have a checkout flow delivered
  So the Ecommerce users could buy clothes

Background: Starts logged in
  Given is logged in with the user "valid_checkout_login"

@checkout_with_check
Scenario: Common Checkout Flow using Check as Payment
  Given has a product on the shopping cart
  And is on the shopping cart
  And select the address and delivery method
  And finalize the checkout with payment by check
  Then the order should be placed successfully

@checkout_with_two_products_check
Scenario: Common Checkout Flow using Bank Wire as Payment with two products on the cart
  Given has two products on the shopping cart
  And is on the shopping cart
  And select the address and delivery method
  And finalize the checkout with payment by check
  Then the order should be placed successfully

@checkout_with_bank_wire
Scenario: Common Checkout Flow using Bank Wire as Payment
  Given has a product on the shopping cart
  And is on the shopping cart
  And select the address and delivery method
  And finalize the checkout with payment by Bank Wire
  Then the order with bank wire should be placed successfully

@checkout_with_two_products_bank_wire
Scenario: Common Checkout Flow using Bank Wire as Payment with two products on the cart
  Given has two products on the shopping cart
  And is on the shopping cart
  And select the address and delivery method
  And finalize the checkout with payment by Bank Wire
  Then the order with bank wire should be placed successfully