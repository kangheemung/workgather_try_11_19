require 'test_helper'

class Planners::PlannersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planners_planners_index_url
    assert_response :success
  end

  test "should get new" do
    get planners_planners_new_url
    assert_response :success
  end

  test "should get show" do
    get planners_planners_show_url
    assert_response :success
  end

  test "should get edit" do
    get planners_planners_edit_url
    assert_response :success
  end

end
