require 'test_helper'

class Planners::ScheculesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planners_schecules_index_url
    assert_response :success
  end

  test "should get new" do
    get planners_schecules_new_url
    assert_response :success
  end

  test "should get show" do
    get planners_schecules_show_url
    assert_response :success
  end

  test "should get edit" do
    get planners_schecules_edit_url
    assert_response :success
  end

end
