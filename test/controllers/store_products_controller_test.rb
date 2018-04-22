require 'test_helper'

class StoreProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_products_index_url
    assert_response :success
    assert_select '#columns#sidea', minimum: 4
    assert_select '#main.entry', 3
    assert_select 'h3','Programming Ruby 1.9'
    assert_select '.price'
  end

end
