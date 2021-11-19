# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), '../../sections/*/*.rb')].sort.each { |file| require file }

class SearchPage < SitePrism::Page
  sections :products, Products::Product, '.ajax_block_product'
  section  :quickview, Products::Quickview, '#layer_cart'
end
