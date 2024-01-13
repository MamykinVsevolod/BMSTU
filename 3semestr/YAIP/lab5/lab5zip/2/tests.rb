# frozen_string_literal: true



require 'minitest/autorun'

require_relative '1'

class TestFunc < Minitest::Test

  def test_func1

    assert_equal('c', operation_1(%w[a b c d e], [1, 2, 3, 4, 5], 3))

    assert_equal(%w[d e], operation_2(%w[a b c d e], [1, 2, 3, 4, 5]))

    assert_equal(%w[b c d e], operation_3(%w[a b c d e], [1, 2, 3, 4, 5]))

  end

end

