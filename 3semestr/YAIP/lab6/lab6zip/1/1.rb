# frozen_string_literal: true

require_relative 'functions'
a = 1
b = 2
puts "Значение с точностью eps = 0.001: #{integral(a, b, 0.001)}"
puts "Значение с точностью eps = 0.0001: #{integral(a, b, 0.0001)}"
