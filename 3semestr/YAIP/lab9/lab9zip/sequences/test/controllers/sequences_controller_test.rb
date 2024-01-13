require 'test_helper'

class SequencesControllerTest < ActionDispatch::IntegrationTest
  test 'should get calculate' do
    get sequences_calculate_url
    assert_response :success
  end
  test 'should get sequence' do
    get sequences_calculate_url, params: { v1: '10', v2: '1 2 3 4 9 16 3 2 4 10' }
    assert_equal assigns[:result], [['1', '4 9 16', '4'], '4 9 16', '3', '1 2 3 4 9 16 3 2 4 10']
  end
  test 'should get sequence - 2' do
    get sequences_calculate_url, params: { v1: '3', v2: '1 4 4' }
    assert_equal assigns[:result], [['1 4 4'], '1 4 4', '3', '1 4 4']
  end
end
