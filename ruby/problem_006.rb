#!/usr/bin/env ruby

=begin problem 006

  The sum of the squares of the first ten natural numbers is,
  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,
  (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is
  3025 - 385 = 2640.

  * Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
    serialhex
=end

range = 1..100

sum_of_squares = range.inject do |sum, n|
  sum + n**2
end

sums = range.inject do |sum, n|
  sum + n
end

square_of_sums = sums ** 2

puts "sum of squares: #{sum_of_squares}"
puts "square of sums: #{square_of_sums}"
puts "difference: #{square_of_sums - sum_of_squares}"
