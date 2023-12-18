require 'test_helper'

class SequencesControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get sequences_input_url
    assert_response :success
  end

  test 'should get view' do
    get sequences_view_url
    assert_response :success
  end

  test 'should get sequence' do
    get sequences_view_url, params: { n: '1 2 3 4 9 16 3 2 4 10' }
    assert_equal assigns[:result][0], [['1', '4 9 16', '4'], '4 9 16', '3', '1 2 3 4 9 16 3 2 4 10']
  end
  test 'should get sequence - 2' do
    get sequences_view_url, params: {n: '1 4 4' }
    assert_equal assigns[:result][0], [['1 4 4'], '1 4 4', '3', '1 4 4']
  end

  # В 1 раз результат добавляется
  test 'the result is not in DB' do
    get sequences_view_url, params: {n: '1 2 3 4 9 16 3 2 4 10 11 12 13 14'}

    assert_equal assigns[:result][2], 0
  end


end
