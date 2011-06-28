#!/usr/bin/env ruby

=begin problem 009

  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
    a^2 + b^2 = c^2

  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  * Find the product abc.
    serialhex
=end


# 3 + 4 + 5 = 12
triple = []
final = 0
br = false
1.upto(1000) do |c|
  break if br
  1.upto(c) do |b|
    1.upto(b) do |a|
      if (a**2 + b**2 == c**2)
        puts [a,b,c].to_s
        if (a + b + c == 1000)
          puts "FOUND ONE!!!"
          final = a*b*c
          triple = [a,b,c]
          br = true
        end
      end
    end
  end
end

puts

puts triple.to_s
puts final