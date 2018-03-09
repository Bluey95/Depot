require 'test_helper'

class StoreProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_products_index_url
    assert_response :success
  end

end
