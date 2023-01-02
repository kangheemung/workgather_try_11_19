require 'test_helper'

class Users::ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_reservation_index_url
    assert_response :success
  end

  test "should get new" do
    get users_reservation_new_url
    assert_response :success
  end

  test "should get show" do
    get users_reservation_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_reservation_edit_url
    assert_response :success
  end

end
