#!/usr/bin/env ruby

=begin problem 020

  n! means n  (n  1)  ...  3  2  1

  For example, 10! = 10  9  ...  3  2  1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  * Find the sum of the digits in the number 100!
    serialhex
=end

require_relative 'euler_helpers'

num = 100.!

ans = sum_of_digits num

puts ans
