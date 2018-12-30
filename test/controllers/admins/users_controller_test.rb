require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_users_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_users_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_users_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_users_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_users_destroy_url
    assert_response :success
  end

end
