# frozen_string_literal: true
class TwinsController < ApplicationController
  def input
    unless signed_in?
      redirect_to signin_path
    end
  end

  def view
    unless signed_in?
      redirect_to signin_path
    end

    longest_subsequence = []  # Самая длинная подпоследовательность
    current_subsequence = []  # Текущая подпоследовательность
    all_subsequences = [] # Все подпоследовательности
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
    @result = [all_subsequences, longest_subsequence.join(' '), subsequence_count.to_s, sequence&.join(' ')]
    @table = '<table>' # Начало таблицы
    if @result[2] != '0'
      @table +=
        "<tr><td>Введенная последовательность:</td></tr><tr><td>#{@result[3]}</td></tr><tr><td>Подпоследовательности:</td></tr>"

      @result[0].each do |res|
        @table += "<tr><td>#{res}</td></tr>"
      end

      @table +=
        "<tr><td>Самая длинная подпоследовательность:</td></tr><tr><td>#{@result[1]}</td></tr><tr><td>Ее длина:</td></tr><tr><td>#{@result[2]}</td></tr>"
    else
      @table +=
        "<tr><td>Введенная последовательность:</td></tr><tr><td>#{@result[3]}</td></tr><tr><td>Подполседовательностей квадратов натуральных чисел нет</td></tr>"
    end
    @table += '</table>' # Конец таблицы
    @tmp = @result.clone
    @result = [@tmp, @table]
  end
end
