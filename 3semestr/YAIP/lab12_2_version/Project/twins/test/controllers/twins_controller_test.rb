require 'test_helper'

class TwinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get input_url
    assert_response 302
  end

  test 'should get view' do
    get view_url
    assert_response 302
  end
  test 'should get sequence' do
    get view_url, params: { n: '1 2 3 4 9 16 3 2 4 10' }
    assert_equal assigns[:result][0], [['1', '4 9 16', '4'], '4 9 16', '3', '1 2 3 4 9 16 3 2 4 10']
  end
  test 'should get sequence - 2' do
    get view_url, params: {n: '1 4 4' }
    assert_equal assigns[:result][0], [['1 4 4'], '1 4 4', '3', '1 4 4']
  end

end
