require 'test_helper'

class Planners::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planners_posts_index_url
    assert_response :success
  end

end
