# frozen_string_literal: true

require_relative 'functions'
surnames = Array.new(5)
puts 'Введите фамилии: '
surnames.each_index { |i| surnames[i] = gets.chop }
paycheks = Array.new(5)
summ = 0
puts 'Введите зарплаты: '
paycheks.each_index do |i|
  paycheks[i] = gets.chop.to_f
  summ += paycheks[i]
end
sr_arifm = summ / 5
puts 'Фамилия работника, зарплата котрого наименее отклоняется от средней:  '
puts operation_1(surnames, paycheks, sr_arifm)
puts 'Фамилии работников, зарплаты которых наибольшие: '
puts operation_2(surnames, paycheks)
puts 'Фамилии работников (исключен работник с наименьшей зарплатой): '
print operation_3(surnames, paycheks)
