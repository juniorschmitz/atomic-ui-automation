# frozen_string_literal: true

When('search for the product {string}') do |product|
  @home_page = HomePage.new
  @home_page.header.search product
end

When('select the address and delivery method') do
  @checkout_page = CheckoutPage.new
  @checkout_page.advance_steps
end

When('finalize the checkout with payment by check') do
  @checkout_page.finalize_with_check
end

When('finalize the checkout with payment by Bank Wire') do
  @checkout_page.finalize_with_bank_wire
end

Then('the order should be placed successfully') do
  @checkout_result_page = CheckoutResultPage.new
  @checkout_result_page.wait_until_alert_success_visible
  expect(@checkout_result_page.alert_success.text.downcase).to include 'your order on my store is complete'
end

Then('the order with bank wire should be placed successfully') do
  @checkout_result_page = CheckoutResultPage.new
  @checkout_result_page.wait_until_p_bank_wire_success_visible
  expect(@checkout_result_page.p_bank_wire_success.text.downcase).to include 'your order on my store is complete'
end
