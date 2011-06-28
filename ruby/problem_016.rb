#!/usr/bin/env ruby

=begin problem 016

  2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

  * What is the sum of the digits of the number 2^1000?
    serialhex
=end

big_ass_number = 2**1000
sum = 0
while big_ass_number > 0 do
  q, r = big_ass_number.divmod 10
  puts r
  sum += r
  big_ass_number = q
end

puts sum
# that was stupid easy...