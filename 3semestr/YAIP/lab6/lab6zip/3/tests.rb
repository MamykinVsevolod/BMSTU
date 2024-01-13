# frozen_string_literal: true

require 'minitest/autorun'
require_relative '1'
class TestFunc < Minitest::Test
  def test_func1
    n = 2048
    value1 = intprg 0, 1 do |a, b|
      res = 0
      h = (b - a) * 1.0 / n
      1.upto(n) do |i|
        x = a + h * i
        res += Math::E**x / (x + 1)
      end
      res *= h
    end
    value2 = lambda do |a, b|
      res = 0
      h = (b - a) * 1.0 / n
      1.upto(n) do |i|
        x = a + h * i
        res += x * (x - 1)
      end
      res *= h
    end
    assert_in_delta 1.1256, value1, 0.001
    assert_in_delta 2 * 1.0 / 3, intprg(0, 2, &value2), 0.001
  end
end
