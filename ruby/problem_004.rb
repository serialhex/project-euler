#!/usr/bin/env ruby

=begin problem 004

  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.

  * Find the largest palindrome made from the product of two 3-digit numbers.
    serialhex
=end

ans = 0
res = 0
999.downto(100) do |num_a|
  999.downto(100) do |num_b|
    res = num_a * num_b
    ans = res if (res.to_s == res.to_s.reverse) && (ans < res)
  end
end

puts ans
