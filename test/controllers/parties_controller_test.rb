require "test_helper"

class PartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get parties_show_url
    assert_response :success
  end
end
