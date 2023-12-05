require 'test_helper'

class SequencesControllerTest < ActionDispatch::IntegrationTest
  test 'should get calculate' do
    get sequences_calculate_url
    assert_response :success
  end

  test 'should get same hash for n = 3' do
    get sequences_calculate_url, params: { n: 3 }
    target = { 3 => 5 }

    assert_equal assigns[:result][0], target
  end

  test 'should get same hash for n = 10' do
    get sequences_calculate_url, params: { n: 10 }
    target = { 11 => 13, 17 => 19 }

    assert_equal assigns[:result][0], target
  end

  test 'should get Unknown! for incorrect params' do
    get sequences_calculate_url
    assert_equal assigns[:result], [{}, 'Unknown!']
  end
end
