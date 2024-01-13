# frozen_string_literal: true

def operation_1(surnames, paychecks, sr_arifm)
  deviation = 1_000_000
  index = 0
  paychecks.each_index do |i|
    if (paychecks[i] - sr_arifm).abs < deviation
      deviation = (paychecks[i] - sr_arifm).abs
      index = i
    end
  end
  surnames[index]
end

def operation_2(surnames, paychecks)
  maximum = 0
  pred_maximum = 0
  paychecks.each_index do |i|
    if paychecks[i] > paychecks[maximum]
      pred_maximum = maximum
      maximum = i
    elsif paychecks[i] > paychecks[pred_maximum]
      pred_maximum = i
    end
  end
  [surnames[pred_maximum], surnames[maximum]]
end

def operation_3(surnames, paycheks)
  minimum = 0
  paycheks.each_index do |i|
    minimum = i if paycheks[i] < paycheks[minimum]
  end
  surnames.delete_at(minimum)
  surnames
end
