@full_regression
@product_page
@product_page_logged_in
Feature: Features on the Product Page
  As a site administrator
  I would like if the ecommerce had a good product page implemented
  So the users would be able to select and change attributes of the products they desire to buy

Background: Starts logged in
  Given is logged in

@pdp_attributes_selection_logged_in
Scenario: Attributes selection
  Given is on the product page
  When change one color attribute
  Then the display image should change

@pdp_write_review_logged_in
Scenario: Write a review
  Given is on the product page
  When write a new review for the product 
  Then the review should be posted

@pdp_add_product_to_cart_logged_in
Scenario: Add product to the shopping cart
  Given is on the product page
  When add the product to the cart
  Then the product should be added to the shopping cart

@pdp_add_two_products_to_cart_logged_in
Scenario: Add two products to the shopping cart
  Given is on the product page
  When increase the product quantity on the product page
  And add the product to the cart
  Then two quantities of the same product should be added to the shopping cart
  
@pdp_add_product_to_wishlist_logged_in
Scenario: Add product to the wishlist
  Given is on the product page
  When add the product to the wishlist
  Then the product should be added to the wishlist
