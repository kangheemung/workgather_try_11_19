require 'test_helper'

class PlannerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get planner_sessions_new_url
    assert_response :success
  end

end
