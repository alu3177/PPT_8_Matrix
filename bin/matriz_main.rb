require 'matrix'

m = IntegerMatrix.new(5, 5)
r = RationalMatrix.new(5, 5)

id = IntegerMatrix::identity 5

puts m
puts r
puts m * id
puts r * id
