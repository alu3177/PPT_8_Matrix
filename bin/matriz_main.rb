require 'matrix'

m = IntegerMatrix.new(5, 5)
r = RationalMatrix.new(5, 5)

puts m
mi = m + m
puts mi
puts mi + m
