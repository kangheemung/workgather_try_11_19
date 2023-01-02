require 'test_helper'

class Planners::ScheculeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planners_schecule_index_url
    assert_response :success
  end

  test "should get new" do
    get planners_schecule_new_url
    assert_response :success
  end

  test "should get show" do
    get planners_schecule_show_url
    assert_response :success
  end

  test "should get edit" do
    get planners_schecule_edit_url
    assert_response :success
  end

end
