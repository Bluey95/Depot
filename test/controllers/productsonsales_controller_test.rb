require 'test_helper'

class ProductsonsalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productsonsale = productsonsales(:one)
    @update = {
      :title => "Lorem Ipsum",
      :description => "Wibbles are fun!",
      :image_url => "lorem.jpg",
      :price => 19.95
    }
  end

  test "should get index" do
    get productsonsales_url
    assert_response :success
  end

  test "should get new" do
    get new_productsonsales_url
    assert_response :success
  end

  test "should create productsonsale" do
    assert_difference('Productsonsale.count') do
        post productsonsales_url, params: { productsonsale: @update }
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
    patch productsonsale_url(@productsonsale), params: { productsonsale: @update  }
    assert_redirected_to productsonsale_url(@productsonsale)
  end

  test "can't delete productsonsale in cart" do
    assert_difference('Productsonsale.count', 0) do
      delete productsonsale_url(productsonsales(:two))
    end
    assert_redirected_to productsonsales_url
  end

test "should destroy productsonsale" do
    assert_difference('Productsonsale.count', -1) do
      delete productsonsale_url(@productsonsale)
    end

    assert_redirected_to productsonsales_url
  end
end
