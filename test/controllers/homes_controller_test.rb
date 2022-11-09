require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get about" do
    get homes_about_url
    assert_response :success
  end

  test "should get select_position_E" do
    get homes_select_position_E_url
    assert_response :success
  end

  test "should get select_position_K" do
    get homes_select_position_K_url
    assert_response :success
  end

  test "should get select_position" do
    get homes_select_position_url
    assert_response :success
  end

  test "should get sign_up" do
    get homes_sign_up_url
    assert_response :success
  end

end
