# frozen_string_literal: true

# my class
class Rk2Controller < ApplicationController
  def input
    @warning_string = '' # для дополнительной проверки
    @result = []
  end

  def init
    @index = params[:k]&.to_i
    @array = params[:array]&.split(' ')&.map(&:to_i) # исходный массив - arr_n
    @ans = true if @index >= @array&.length
  end

  # дополнительная проверка
  def additional_verification
    if @index >= @array.length
      @warning_string = '>'
    else
      @sum = @array.select { |num| (num % 3).zero? }.sum
      @result = @array.clone
      @result[@index] = @sum
    end
  end

  def view
    init
    if @ans
      flash.now[:alert] = "Элемент с индексом #{@index} не существует!"
      render action: 'input'
      nil
    end
    additional_verification
  end
end
