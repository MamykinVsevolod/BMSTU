# frozen_string_literal: true

require_relative 'functions'

my_string = gets.chop

my_array = my_string.split

puts 'Исходная строка: ' + my_string

my_array[-1] = my_array[-1].delete_suffix('.')

puts 'Полученная строка: ' + permutations(my_array)
