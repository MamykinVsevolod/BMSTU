# frozen_string_literal: true
class SequencesController < ApplicationController
  def calculate
    longest_subsequence = []  # Самая длинная подпоследовательность
    current_subsequence = []  # Текущая подпоследовательность
    all_subsequences = [] # Все подпоследовательности
    # unless params[:v2].nil?
    sequence = params[:v2]&.split(' ')&.map(&:to_i)
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
    @number = [params[:v1], sequence&.size.to_s]
    @result = [all_subsequences, longest_subsequence.join(' '), subsequence_count.to_s, sequence&.join(' ')]
    # end
    # @number = [params[:v1], 0]
    # @result = [all_subsequences, '', '0', '']
    logger.debug "from view controller: #{@result}"
    respond_to do |format|
      format.html
      format.json do
        render json:
                 { type: @result.class.to_s, value1: @result, value2: @number }
      end
    end
  end
end
