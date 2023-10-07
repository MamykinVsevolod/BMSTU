# frozen_string_literal: true



require 'minitest/autorun'



require_relative '1'



class TestFunc < Minitest::Test

  def test_func1

    assert_in_delta 2.83333, my_function(1.0, 2.0), 0.001

  end



  def test_func2

    assert_in_delta 4.75000, my_function(1.0, 2.5), 0.001

  end



  def test_func3

    assert_in_delta 2.83333, my_function(2.0, 1.0), 0.001

  end

end

