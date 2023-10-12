# frozen_string_literal: true



require 'minitest/autorun'



require_relative '1'



class TestFunc < Minitest::Test

  def test_func1

    s = ''



    1.upto(rand(1..10) * 2) { s += (1..rand(30)).map { rand(97..122).chr }.join + ' ' }



    s = s.delete_suffix(' ')



    s += '.'



    my_arr = s.split



    my_arr2 = s.split



    my_arr[-1] = my_arr[-1].delete_suffix('.')



    my_arr2[-1] = my_arr2[-1].delete_suffix('.')



    print 'test: ' + s



    assert_equal(proverka(my_arr), permutations(my_arr2))

  end

end

