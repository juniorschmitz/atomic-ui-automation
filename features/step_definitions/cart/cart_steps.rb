# frozen_string_literal: true

Given('is logged in with the user {string} and with a product on the shopping cart') do |user|
  @home_page = HomePage.new
  @home_page.load
  @user = Factory::Static.static_data(user)
  StateController::StateSetter.set_logged_user(@user['email'], @user['password'])
  products = [{ id: '5', ipa: '19' }]
  StateController::StateSetter.set_cart_status(products, @user['token'])
end

Given('is logged in with the user {string}') do |user|
  @home_page = HomePage.new
  @home_page.load
  @user = Factory::Static.static_data(user)
  StateController::StateSetter.set_logged_user(@user['email'], @user['password'])
end

Given('has a product on the shopping cart') do
  products = [{ id: '5', ipa: '19' }]
  StateController::StateSetter.set_cart_status(products, @user['token'])
end

Given('has two products on the shopping cart') do
  products = [{ id: '5', ipa: '19' }, { id: '1', ipa: '1' }]
  StateController::StateSetter.set_cart_status(products, @user['token'])
end

When('is on the shopping cart') do
  @cart_page = CartPage.new
  @cart_page.load
end

When('exclude the product from the shopping cart') do
  @cart_page = CartPage.new
  @cart_page.exclude_product
end

Then('the cart should be empty') do
  @cart_page.wait_until_p_message_empty_cart_visible
  expect(@cart_page.p_message_empty_cart.text).to include 'Your shopping cart is empty.'
end

When('increase the product quantity') do
  @cart_page = CartPage.new
  @value_before_increasing = @cart_page.get_total_cart_value
  @cart_page.increase_product_quantity
end

When('decrease the product quantity') do
  @cart_page = CartPage.new
  @cart_page.decrease_product_quantity
end

Then('the product quantity should be increased') do
  sleep 2
  value_after_increasing = @cart_page.get_total_cart_value
  expect(value_after_increasing).to be > @value_before_increasing
end

When('continue shopping') do
  @cart_page = CartPage.new
  @cart_page.btn_continue_shopping.click
end

Then('should go back to the search page') do
  expect(@cart_page.current_url).not_to include 'controller=order'
end

When('proceed with the checkout') do
  @cart_page = CartPage.new
  @cart_page.proceed_to_checkout
end

Then('the address page should be displayed') do
  @checkout_page = CheckoutPage.new
  expect(@checkout_page.current_url).to include 'controller=order&step=1'
end
