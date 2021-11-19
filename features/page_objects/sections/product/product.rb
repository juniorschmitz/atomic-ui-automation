# frozen_string_literal: true

module Products
  class Product < SitePrism::Section
    element  :quickview, '.quick-view'
    element  :btn_add_to_bag, '.ajax_add_to_cart_button'
    element  :image, 'img'
  end
end
