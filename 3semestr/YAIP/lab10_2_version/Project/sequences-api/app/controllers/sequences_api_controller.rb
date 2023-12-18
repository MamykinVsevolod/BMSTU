# frozen_string_literal: true

# my class
class SequencesApiController < ApplicationController

  def view
    longest_subsequence = []  # Самая длинная подпоследовательность
    current_subsequence = []  # Текущая подпоследовательность
    all_subSequences = [] # Все подпоследовательности
    # unless params[:v2].nil?
    sequence = params[:n]&.split(' ')&.map(&:to_i)
    sequence&.each do |number|
      if (Math.sqrt(number) % 1).zero?
        # Если число является полным квадратом
        current_subsequence << number
      else
        # Если число не является полным квадратом
        longest_subsequence = current_subsequence.clone if current_subsequence.length > longest_subsequence.length
        cur = current_subsequence.clone
        all_subSequences << cur.join(' ')
        all_subSequences.pop if all_subSequences[all_subSequences.size - 1] == ''
        current_subsequence = []
      end
    end
    cur = current_subsequence.clone
    all_subSequences << cur.join(' ') if cur.length.positive?
    longest_subsequence = current_subsequence.clone if current_subsequence.length > longest_subsequence.length
    all_subSequences.pop if all_subSequences[all_subSequences.size - 1] == ''
    subsequence_count = longest_subsequence.length
    @table = '<catalog>' # Начало таблицы
    @result = [all_subSequences, longest_subsequence.join(' '), subsequence_count.to_s, sequence&.join(' ')]
    if @result[2] != '0'
      @table +=
        "<cd><id>Введенная последовательность:</id></cd><cd><id>#{@result[3]}</id></cd><cd><id>Подпоследовательности:</id></cd>"

      @result[0].each do |res|
        @table += "<cd><id>#{res}</id></cd>"
      end

      @table +=
        "<cd><id>Самая длинная подпоследовательность:</id></cd><cd><id>#{@result[1]}</id></cd><cd><id>Ее длина:</id></cd><cd><id>#{@result[2]}</id></cd>"
    else
      @table +=
        "<cd><id>Введенная последовательность:</id></cd><cd><id>#{@result[3]}</id></cd><cd><id>Подполседовательностей квадратов натуральных чисел нет</id></cd>"
    end
    @table += '</catalog>' # Конец таблицы
    @tmp = @result.clone
    @result = [@tmp, @table]

  end
end
