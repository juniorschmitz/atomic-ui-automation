# frozen_string_literal: true

module Products
  class Quickview < SitePrism::Section
    element :btn_proceed_to_checkout, 'a[title="Proceed to checkout"]'
  end
end
