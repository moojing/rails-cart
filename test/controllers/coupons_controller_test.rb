require 'test_helper'

class CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get coupons_check_url
    assert_response :success
  end

end
