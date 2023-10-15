# frozen_string_literal: true

require_relative 'functions'
n = 2048
puts "Вычисление через блок: #{intprg(0, 1) do |a, b|
  res = 0
  h = (b - a) * 1.0 / n
  1.upto(n) do |i|
    x = a + h * i
    res += Math::E**x / (x + 1)
  end
  res *= h
end}"
value = lambda do |a, b|
  res = 0
  h = (b - a) * 1.0 / n
  1.upto(n) do |i|
    x = a + h * i
    res += x * (x - 1)
  end
  res *= h
end
puts "Вычисление через lambda-функцию: #{intprg(0, 2, &value)}"
