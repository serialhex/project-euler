#!/usr/bin/env ruby

=begin problem 007

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

  * What is the 10001st prime number?
    serialhex
=end

require 'prime'

# this should be considered cheating...
num = 0
times = 0
Prime.each do |prime|
  times += 1
  if times == 10001
    num = prime
    break
  end
end

puts num