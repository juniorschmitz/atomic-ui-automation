# frozen_string_literal: true

module Modals
  class ProductAdded < SitePrism::Section
    element  :h2_txt_product_added,
             'h2 .ajax_cart_product_txt:not([style="display: none;"]), h2 .ajax_cart_product_txt_s:not([style="display: none;"])'
    element  :span_total_products, '.ajax_block_products_total'
    element  :span_total_shipping, '.ajax_cart_shipping_cost'
    element  :span_total, '.ajax_block_cart_total'
    element  :btn_continue_shopping, 'span[title="Continue shopping"]'
    element  :btn_proceed_to_checkout, 'a[title="Proceed to checkout"]'
  end
end
