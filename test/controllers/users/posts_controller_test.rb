require 'test_helper'

class Users::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_posts_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_posts_update_url
    assert_response :success
  end

end
