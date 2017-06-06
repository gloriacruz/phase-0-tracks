def print_method
  puts "This is before the block."
  yield("Gloria", "Michael")
  puts "This is after the block."
end

print_method { |name1, name2| puts "#{name1 } and #{name2}." }
