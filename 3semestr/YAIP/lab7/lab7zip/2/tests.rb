# frozen_string_literal: true

require 'minitest/autorun'
require_relative '1'
class TestFunc < Minitest::Test
  def test_func1
    assert_equal(proverka, true)
  end
end
