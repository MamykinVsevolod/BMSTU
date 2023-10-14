# frozen_string_literal: true

$number_of_iteration = 0
def F(x)
  Math.log(x)
end

def get_value(a, b, n)
  h = ((b - a) * 1.0 / n)
  res = 0
  1.upto(n) do |i|
    x = a + h * i
    res += F(x)
    $number_of_iteration += 1
  end
  res *= h
  res
end

def integral(a, b, eps)
  cur = get_value(a, b, 2)
  prev = -10_000
  n = (2..20).map { |i| 2**i }
  n.each do |i|
    $number_of_iteration = 0
    prev = cur
    cur = get_value(a, b, i)
    break if (cur - prev).abs < eps
  end
  puts "Количество итераций : #{$number_of_iteration}"
  cur
end
