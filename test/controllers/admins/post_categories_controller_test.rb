require 'test_helper'

class Admins::PostCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_post_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_post_categories_show_url
    assert_response :success
  end

  test "should get create" do
    get admins_post_categories_create_url
    assert_response :success
  end

  test "should get new" do
    get admins_post_categories_new_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_post_categories_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get admins_post_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_post_categories_update_url
    assert_response :success
  end

end
