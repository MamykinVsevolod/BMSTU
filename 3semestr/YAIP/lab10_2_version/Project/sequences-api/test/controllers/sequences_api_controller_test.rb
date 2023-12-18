require "test_helper"

class SequencesApiControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get sequences_api_input_url
    assert_response :success
  end

  test "should get view" do
    get sequences_api_view_url
    assert_response :success
  end
end
