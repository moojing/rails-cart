require 'test_helper'

class Admins::CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_coupons_index_url
    assert_response :success
  end

  test "should get update" do
    get admins_coupons_update_url
    assert_response :success
  end

  test "should get edit" do
    get admins_coupons_edit_url
    assert_response :success
  end

  test "should get show" do
    get admins_coupons_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_coupons_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_coupons_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_coupons_destroy_url
    assert_response :success
  end

end
