require "test_helper"

class ResultTest < ActiveSupport::TestCase
  def add_record(n = '1 2 3 4 9 16 3 2 4 10', data = [['1', '4 9 16', '4'], '4 9 16', '3', '1 2 3 4 9 16 3 2 4 10'])
    record = Result.new(:input => n, :result => data)
    record.save
    record
  end

  test "Add data" do
    res = [['1', '4 9 16', '4'], '4 9 16', '3', '1 2 3 4 9 16 3 2 4 10']
    record = add_record('1 2 3 4 9 16 3 2 4 10', res)
    assert record
  end

  test "Find data" do
    add_record
    record = Result.find_by_input('1 2 3 4 9 16 3 2 4 10')

    assert record
  end
  test "Add same result" do
    add_record
    assert_raises(ActiveRecord::RecordNotUnique) do
      add_record
    end
  end
end
