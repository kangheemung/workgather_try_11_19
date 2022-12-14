require 'test_helper'

class Users::WorkshopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_workshops_index_url
    assert_response :success
  end

  test "should get show" do
    get users_workshops_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_workshops_edit_url
    assert_response :success
  end

  test "should get new" do
    get users_workshops_new_url
    assert_response :success
  end

end
