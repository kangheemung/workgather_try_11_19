require 'test_helper'

class Planners::PlannerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get planners_planner_sessions_new_url
    assert_response :success
  end

end
