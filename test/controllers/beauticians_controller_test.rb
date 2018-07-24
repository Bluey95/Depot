require 'test_helper'

class BeauticiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beautician = beauticians(:one)
  end

  test "should get index" do
    get beauticians_url
    assert_response :success
  end

  test "should get new" do
    get new_beautician_url
    assert_response :success
  end

  test "should create beautician" do
    assert_difference('Beautician.count') do
      post beauticians_url, params: { beautician: { bio: @beautician.bio, experience: @beautician.experience, first_name: @beautician.first_name, image_url: @beautician.image_url, last_name: @beautician.last_name, phone: @beautician.phone, user_id: @beautician.user_id } }
    end

    assert_redirected_to beautician_url(Beautician.last)
  end

  test "should show beautician" do
    get beautician_url(@beautician)
    assert_response :success
  end

  test "should get edit" do
    get edit_beautician_url(@beautician)
    assert_response :success
  end

  test "should update beautician" do
    patch beautician_url(@beautician), params: { beautician: { bio: @beautician.bio, experience: @beautician.experience, first_name: @beautician.first_name, image_url: @beautician.image_url, last_name: @beautician.last_name, phone: @beautician.phone, user_id: @beautician.user_id } }
    assert_redirected_to beautician_url(@beautician)
  end

  test "should destroy beautician" do
    assert_difference('Beautician.count', -1) do
      delete beautician_url(@beautician)
    end

    assert_redirected_to beauticians_url
  end
end
