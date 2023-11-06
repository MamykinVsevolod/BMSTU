# frozen_string_literal: true

$number_of_iteration = 0
def F(x)
  Math.log(x)
end

def get_value(a, b, n)
  h = ((b - a) * 1.0 / n)
  res = 0
  i = 1
  n.times do
    x = a + h * i
    res += F(x)
    i += 1
    $number_of_iteration += 1
  end
  res *= h
  res
end

# def integral(a, b, eps)
#   n = 2
#   cur = get_value(a, b, n)
#   prev = -10_000
#   while (cur - prev).abs > eps
#     $number_of_iteration = 0
#     prev = cur
#     n *= 2
#     cur = get_value(a, b, n)
#   end
#   puts "Количество итераций : #{$number_of_iteration}"
#   cur
# end
#
def integral(a, b, eps, n = 2, prev = -10_000)
  cur = get_value(a, b, n)
  if (cur - prev).abs <= eps
    puts "Количество итераций: #{$number_of_iteration}"
    cur
  else
    $number_of_iteration = 0
    integral(a, b, eps, n * 2, cur)
  end
end
