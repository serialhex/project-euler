#!/usr/bin/env ruby

=begin problem 005

  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  * What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    serialhex
=end

require 'prime'

range = 1..20

prime_n_power = []
range.each do |n|
  n.prime_division.each{ |i| 
    prime_n_power << i
  }
end

puts "primes: #{prime_n_power}"
prime_n_power.uniq!
puts "unique primes: #{prime_n_power}"

primes = []
prime_n_power.each do |prime, power|
  while primes.count(prime) < power
    primes << prime
  end
end

puts "primes: #{primes}"
ans = primes.inject(1) do |mult, n|
  mult * n
end

puts "the answer is: #{ans}"