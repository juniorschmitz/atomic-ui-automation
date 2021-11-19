@full_regression
@search
Feature: Products Search
  I would like to be able to search for products
  As a user
  So I can buy stuff after

@search_existent_product
Scenario: Search for valid product
  Given is on the home page
  When search for the product "shirt"
  Then there should be some results

@search_non_existent_product
Scenario: Search for inexistent product
  Given is on the home page
  When search for the product "camiseta"
  Then there should not be product results
