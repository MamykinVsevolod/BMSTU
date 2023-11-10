def perfect_squares(sequence)
  # Функция, которая проверяет, является ли подпоследовательность полными квадратами
  subsequence_count = 0 # Количество полных квадратов
  longest_subsequence = []  # Самая длинная подпоследовательность
  current_subsequence = []  # Текущая подпоследовательность

  sequence.each do |number|
    if Math.sqrt(number) % 1 == 0
      # Если число является полным квадратом
      current_subsequence << number
    else
      # Если число не является полным квадратом
      longest_subsequence = current_subsequence.clone if current_subsequence.length > longest_subsequence.length
      current_subsequence = []
    end
  end

  longest_subsequence = current_subsequence.clone if current_subsequence.length > longest_subsequence.length

  subsequence_count = longest_subsequence.length

  [longest_subsequence, subsequence_count]
end

# Пример использования
n = 9
sequence = [1, 2, 4, 3, 9, 16, 5, 6, 7]

longest_subsequence, subsequence_count = perfect_squares(sequence)

if subsequence_count > 0
  puts 'Отрезки, состоящие из полных квадратов:'
  longest_subsequence.each do |number|
    puts number
  end
  puts "Самый длинный отрезок: #{longest_subsequence.length} чисел"
  puts "Всего #{subsequence_count} отрезков"
else
  puts 'В последовательности нет отрезков, состоящих из полных квадратов'
end
