require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get check" do
    get :check
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
