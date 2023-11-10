# frozen_string_literal: true

class SequencesController < ApplicationController
  def input
  end
  def view
    # Функция, которая проверяет, является ли подпоследовательность полными квадратами
    longest_subsequence = []  # Самая длинная подпоследовательность
    current_subsequence = []  # Текущая подпоследовательность
    all_subsequences = [] # Все подпоследовательности
    sequence = params[:v2].split(' ').map(&:to_i)
    sequence.each do |number|
      if (Math.sqrt(number) % 1).zero?
        # Если число является полным квадратом
        current_subsequence << number
      else
        # Если число не является полным квадратом
        longest_subsequence = current_subsequence.clone if current_subsequence.length > longest_subsequence.length
        cur = current_subsequence.clone
        all_subsequences << cur.join(' ')
        all_subsequences.pop if all_subsequences[all_subsequences.size - 1] == ''
        current_subsequence = []
      end
    end
    cur = current_subsequence.clone
    all_subsequences << cur.join(' ') if cur.length.positive?
    longest_subsequence = current_subsequence.clone if current_subsequence.length > longest_subsequence.length
    all_subsequences.pop if all_subsequences[all_subsequences.size - 1] == ''
    subsequence_count = longest_subsequence.length
    @number = [params[:v1], sequence.size.to_s]
    @result = [all_subsequences, longest_subsequence.join(' '), subsequence_count.to_s, sequence.join(' ')]

  end
end
