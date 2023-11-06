# frozen_string_literal: true

require 'minitest/autorun'
require_relative '1'
class TestFunc < Minitest::Test
  def test_func1
    assert_equal(true, File.exist?('F.txt'))
    assert_equal(proverka, fill_the_files)
  end

  def test_func2
    assert_equal(true, File.exist?('F.txt'))
    assert_equal(proverka, fill_the_files)
  end

  def test_func3
    assert_equal(true, File.exist?('F.txt'))
    assert_equal(proverka, fill_the_files)
  end
end
