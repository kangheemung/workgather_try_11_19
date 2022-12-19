require 'test_helper'

class Planners::WorkshopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planners_workshops_index_url
    assert_response :success
  end

  test "should get show" do
    get planners_workshops_show_url
    assert_response :success
  end

  test "should get create" do
    get planners_workshops_create_url
    assert_response :success
  end

  test "should get new" do
    get planners_workshops_new_url
    assert_response :success
  end

  test "should get edit" do
    get planners_workshops_edit_url
    assert_response :success
  end

end
