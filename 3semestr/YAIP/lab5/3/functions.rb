# frozen_string_literal: true

def permutations(my_arr)
  my_array = my_arr.clone
  my_array.each_index do |i|
    my_array[i] = my_array[i + 1] unless i.odd?
  end
  my_array.join(' ')
end

def proverka(my_arr)
  flag = true
  my_array = my_arr.clone
  my_array2 = my_arr.clone
  my_array2.each_index do |i|
    my_array2[i] = my_array2[i + 1] unless i.odd?
  end
  my_array2.each_index do |i|
    flag = false if !i.odd? && (my_array2[i] != my_array[i - 1])
  end
  if flag
    my_array.join(' ')
  else
    my_array2.join(' ')
  end
end
