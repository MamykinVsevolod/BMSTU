require 'securerandom'
def generate_random_string(length)
  SecureRandom.alphanumeric(length)
end

def fill_the_files
  f_file = File.open('F.txt', 'w')
  rand(1..10).times do
    random_string = generate_random_string(rand(5..10))
    f_file.puts random_string
  end
  f_file.close
  f_file = File.open('F.txt', 'r')
  g_file = File.open('G.txt', 'w')
  f_file.each_line do |line|
    reversed_line = line.chomp.reverse
    g_file.puts reversed_line
  end
  f_file.close
  g_file.close
  true
end

def proverka
  f_file = File.open('F.txt', 'r')
  g_file = File.open('G.txt', 'r')
  f_file.each_line do |line|
    reserved_line = line.chomp.reverse
    line_from_g_file = g_file.gets.chomp
    return false if reserved_line != line_from_g_file
  end
  
  true
end
