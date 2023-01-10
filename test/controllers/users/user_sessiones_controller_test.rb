require 'test_helper'

class Users::UserSessionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_user_sessiones_new_url
    assert_response :success
  end

end
