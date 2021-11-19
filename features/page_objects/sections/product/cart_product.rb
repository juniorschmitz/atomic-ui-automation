# frozen_string_literal: true

module Products
  class CartProduct < SitePrism::Section
    element  :btn_increase, 'i.icon-plus'
    element  :btn_decrease, 'i.icon-minus'
    element  :btn_exclude, 'i.icon-trash'
  end
end
