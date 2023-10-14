# frozen_string_literal: true



require 'minitest/autorun'

require_relative '1'

class TestFunc < Minitest::Test

  def test_func1

    assert_in_delta 0.3862943611199, integral(1, 2, 0.001), 0.001

    assert_in_delta 0.3862943611199, integral(1, 2, 0.0001), 0.0001

  end

end

