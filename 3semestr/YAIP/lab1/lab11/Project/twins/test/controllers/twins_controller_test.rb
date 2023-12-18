require 'test_helper'

class TwinsControllerTest < ActionDispatch::IntegrationTest
  def add_record(n = 10, data = { "11": 13, "17": 19 })
    record = Result.new(:input => n, :result => data.to_json)
    record.save
    record
  end

  test 'should get input' do
    get twins_input_url
    assert_response :success
  end

  test 'should get view' do
    get twins_view_url
    assert_response :success
  end

  test 'should get same hash for n = 3' do
    get twins_view_url, params: { n: 3 }
    target = { 3 => 5 }

    assert_equal assigns[:result][0], target
  end

  test 'should get same hash for n = 10' do
    get twins_view_url, params: { n: 10 }
    target = { 11 => 13, 17 => 19 }

    assert_equal assigns[:result][0], target
  end

  test 'should get Unknown! for incorrect params' do
    get twins_view_url
    assert_equal assigns[:result],  [{}, "Unknown!", 0]
  end

  # В 1 раз результат добавляется
  test 'the result is not in DB' do
    get twins_view_url, params: { n: 10 }

    assert_equal assigns[:result][2], 0
  end

  # Во 2 раз результат не считается, а достается из БД
  test 'the result is not counted again' do
    add_record
    get twins_view_url, params: { n: 10 }

    assert_equal assigns[:result][2], 1
  end
end
