#!/usr/bin/env ruby

=begin stuff
  
  a few small funcs / classes (maybe) to help me do some of the euler project thingys faster.  you know, to DRY up all my code!
  
  serialhex
=end

def sum_of_digits(num)
  sum = 0
  while num > 0 do
    q, r = num.divmod 10
    sum += r
    num = q
  end
  return sum
end

@fib = [1,1]
def fib(n)
  return 1 if (n <= 1)
  @fib[n] ||= fib(n-1) + fib(n-2)
end

Integer.class_eval do
  # a more idiomatic factorial
  # disfortunately it must be called with the period, like thus:
  # 100.!
  # still, it's not too bad :D
  def !
    self > 0 ? self * (self-1).! : 1
  end

  def collatz_sequence
    raise( ArgumentError, "Number is not >= 1") unless (self >= 1)
    seq = []
    num = self
    while num
      seq << num
      if num.even?
        num = num/2
      elsif num.odd?
        num = 3*num + 1
      else
        puts "if it's not even or odd, what is it??"
      end
      break if (num == 1)
    end
    return seq
  end

  alias :collatz_seq :collatz_sequence

end


