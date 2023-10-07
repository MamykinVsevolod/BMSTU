# frozen_string_literal: true

def permutations(my_array)
  my_array.each_index do |i|
    my_array[i], my_array[i + 1] = my_array[i + 1], my_array[i] unless i.odd?
  end

  my_array.join(' ')
end
