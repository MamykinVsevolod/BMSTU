# frozen_string_literal: true
require 'json'

class TwinsController < ApplicationController
  def input; end

  def view
    longest_subsequence = []  # Самая длинная подпоследовательность
    current_subsequence = []  # Текущая подпоследовательность
    all_subSequences = [] # Все подпоследовательности
    # unless params[:v2].nil?
    sequence = params[:n]&.split(' ')&.map(&:to_i)
    record = Result.find_by_input(sequence&.join(' '))
    #puts record
    if !record
      rec_exists = 0
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
      @result = [all_subSequences, longest_subsequence.join(' '), subsequence_count.to_s, sequence&.join(' ')]
      json_res = @result.to_json
      result = Result.new(:input => sequence&.join(' '), :result => json_res)
      result.save
      print 'Запись добалена в БД ', result, "\n"
    else
      rec_exists = 1
      pp 'Record result:', record.result
      @result = JSON.parse(record.result)
      pp 'Результат уже посчитан'
    end
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
    @result = [@tmp, @table, rec_exists]
  end
end

