#!/usr/bin/env ruby

=begin problem 014

  The following iterative sequence is defined for the set of positive integers:

  n = n/2 (n is even)
  n = 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

  13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  * Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
    serialhex
=end

require_relative 'euler_helpers'

seq = []
number = 0
1_000_000.downto(1) do |num|
  tmp = num.collatz_seq
  print num, ' '
  if (seq.length < tmp.length) # i know, a but more verbose than needed, but whatev!
    number = num
    seq = tmp
    puts '', seq.to_s
  end
end

puts "Answer: #{number}"