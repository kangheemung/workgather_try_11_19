require 'test_helper'

class Planners::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planners_reservations_index_url
    assert_response :success
  end

end
