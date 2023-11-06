# frozen_string_literal: true

require_relative 'functions'
symbol_a = Symbols.new('A')
record_b = Record.new('B', 4)
# Вызов методов
symbol_a.display_value
puts symbol_a.symbol_field
puts symbol_a.symbol_code
record_b.display_value
puts record_b.symbol_field
puts record_b.symbol_code
puts record_b.repeat_count
record_b.display_string
