require 'test_helper'

class LineItemProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item_product = line_item_products(:one)
  end

  test "should get index" do
    get line_item_products_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_product_url
    assert_response :success
  end

  test "should create line_item_product" do
    assert_difference('LineItemProduct.count') do
      post line_item_products_url, params: { productsonsale_id: productsonsales(:ruby).id}
    end

    follow_redirect!

    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'li', '1 \U00D7 Programming Ruby 1.9'
  end

  test "should show line_item_product" do
    get line_item_product_url(@line_item_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_product_url(@line_item_product)
    assert_response :success
  end

  test "should update line_item_product" do
    patch line_item_product_url(@line_item_product),
    params: { line_item_product: {productsonsale_id: @line_item_product.productsonsale_id } }
    assert_redirected_to line_item_product_url(@line_item_product)
  end

  test "should destroy line_item_product" do
    assert_difference('LineItemProduct.count', -1) do
      delete line_item_product_url(@line_item_product)
    end

    assert_redirected_to line_item_products_url
  end

  test "should create line_item_product via ajax" do
    assert_difference('LineItemProduct.count') do
    post line_item_products_url, params: { productsonsale_id: productsonsales(:ruby).id },
    xhr: true
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
    assert_select 'tr#current_item td', /Programming Ruby 1.9/
  end
end
