require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get d" do
    get users_d_url
    assert_response :success
  end

end
