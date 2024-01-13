# frozen_string_literal: true

require_relative 'functions'
my_string = gets.chop
my_array = my_string.split
puts "Исходная строка: #{my_string}"
my_array[-1] = my_array[-1].delete_suffix('.')
# print my_array
# puts
puts "Полученная строка: #{permutations(my_array)}"
# print my_array
# s = ''
# 0.upto(rand(1..10) * 2) { s += (1..rand(30)).map { rand(97..122).chr }.join + ' '
# s = s.delete_suffix(' ')
# s += '.'
# puts s
