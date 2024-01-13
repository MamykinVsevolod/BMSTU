# frozen_string_literal: true

require_relative 'functions'
puts 'Введите x: '
x = gets.chop.to_f
puts 'Введите y: '
y = gets.chop.to_f
print "Результат: #{format('%0.5f', my_function(x, y))}"
