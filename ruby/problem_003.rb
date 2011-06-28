#!/usr/bin/env ruby

=begin problem 003

  The prime factors of 13195 are 5, 7, 13 and 29.

  * What is the largest prime factor of the number 600851475143 ?
    serialhex
=end

require 'prime'

factors = []
600851475143.prime_division.each do |prime, pow|
  factors << prime
end

largest_prime = factors.max

puts "factors: #{factors}"
puts "largest prime: #{largest_prime}"