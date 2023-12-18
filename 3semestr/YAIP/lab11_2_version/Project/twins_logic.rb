# frozen_string_literal: true

def sequences(n)
  pairs = {}
  (n..2 * n).each do |first|
    (first..2 * n).each do |second|
      pairs[first] = second if second - first == 2
    end
  end

  pairs.empty? ? 'No pairs' : pairs

end

puts sequences(10)
puts sequences(1)
