require 'test_helper'

class SoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get recieve" do
    get sounds_recieve_url
    assert_response :success
  end

end
