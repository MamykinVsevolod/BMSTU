require "test_helper"

class SequencesControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get sequences_input_url
    assert_response :success
  end

  test "should get view" do
    get sequences_view_url
    assert_response :success
  end
end
