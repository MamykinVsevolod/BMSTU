class Symbols
  def initialize(value)
    @value = value
  end

  def display_value
    puts @value
  end

  def symbol_field
    @value
  end

  def symbol_code
    @value.ord
  end
end

class Record < Symbols
  def initialize(value, repeat_count)
    super(value)
    @repeat_count = repeat_count
  end

  def display_string
    puts @value * @repeat_count
  end
  attr_reader :repeat_count
end

def proverka
  symbol_a = Symbols.new('A')
  record_b = Record.new('B', 4)
  symbol_a.is_a?(Symbols) && record_b.is_a?(Symbols) && record_b.is_a?(Record)
end
