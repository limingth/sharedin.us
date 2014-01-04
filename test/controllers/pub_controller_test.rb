require 'test_helper'

class PubControllerTest < ActionController::TestCase
  test "should get dir" do
    get :dir
    assert_response :success
  end

end
