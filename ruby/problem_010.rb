#!/usr/bin/env ruby

=begin problem 010

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  * Find the sum of all the primes below two million.
    serialhex
=end

# this should be stupid easy...
# so i'm only gonna use one hand :P

require 'prime'

sum = 0
Prime.each do |prime|
  break if (prime > 2_000_000)
  puts prime
  sum += prime
end

puts sum