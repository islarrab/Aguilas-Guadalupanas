require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @update = {
      :email => 'Lorem@Ipsum.com'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
