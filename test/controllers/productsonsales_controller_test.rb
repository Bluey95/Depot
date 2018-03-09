require 'test_helper'

class ProductsonsalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productsonsale = productsonsales(:one)
  end

  test "should get index" do
    get productsonsales_url
    assert_response :success
  end

  test "should get new" do
    get new_productsonsale_url
    assert_response :success
  end

  test "should create productsonsale" do
    assert_difference('Productsonsale.count') do
      post productsonsales_url, params: { productsonsale: { \title: @productsonsale.\title, description: @productsonsale.description, image_url: @productsonsale.image_url, price: @productsonsale.price } }
    end

    assert_redirected_to productsonsale_url(Productsonsale.last)
  end

  test "should show productsonsale" do
    get productsonsale_url(@productsonsale)
    assert_response :success
  end

  test "should get edit" do
    get edit_productsonsale_url(@productsonsale)
    assert_response :success
  end

  test "should update productsonsale" do
    patch productsonsale_url(@productsonsale), params: { productsonsale: { \title: @productsonsale.\title, description: @productsonsale.description, image_url: @productsonsale.image_url, price: @productsonsale.price } }
    assert_redirected_to productsonsale_url(@productsonsale)
  end

  test "should destroy productsonsale" do
    assert_difference('Productsonsale.count', -1) do
      delete productsonsale_url(@productsonsale)
    end

    assert_redirected_to productsonsales_url
  end
end
