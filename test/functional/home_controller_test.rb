require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get degree" do
    get :degree
    assert_response :success
  end

end
