require "pry"
# require "mathn"

Array.class_eval do
  # these are *TOTALLY* not-safe!!!
  def sum
    @sum ||= self.reduce(:+)
  end
  def mean
    @mean ||= sum*1.0 / self.length
  end
  def variance
    @variance ||= (self.inject(0) {|sum, n| sum + (n - self.mean)**2 }) / self.length
  end
  def merge ary
    # hopefully ary < self
    self.map { |s|
      ary.map { |a| a + s }
    }.flatten
  end
end



@@fact=[0,1]
def fact n
  @@fact[n+1] ||= n * fact(n-1)
end

def combination n, k
  (fact(n)) / (fact(k) * fact(n-k) * 1.0)
end


# An unbiased single 4-sided die is thrown and its value, T, is noted.
# T unbiased 6-sided dice are thrown and their scores are added together. The sum, C, is noted.
# C unbiased 8-sided dice are thrown and their scores are added together. The sum, O, is noted.
# O unbiased 12-sided dice are thrown and their scores are added together. The sum, D, is noted.
# D unbiased 20-sided dice are thrown and their scores are added together. The sum, I, is noted.
# Find the variance of I, and give your answer rounded to 4 decimal places.


class Dice
  def initialize num, sides
    @sides, @num = sides, num
  end

  def mean
    (1 + @sides) * @num / 2.0
  end

  def variance
    ((@sides**2)/12.0 - 1/12.0) * @num
  end

  def std_dev
    variance**(1/2.0)
  end

  def to_a
    ary=[]
    (@sides * @num - @num + 1).times {|i| ary << i + @num }
    ary
  end

  def num_prob num
    sum=0
    0.upto(((num - @num)/@sides).floor) do |i|
      sum += (-1.0)**i * combination(@num, i) * combination( (num - @sides*i - 1), (@num - 1) )
    end
    (1.0 / @sides**@num) * sum
  end

  def num
    @sides ** @num
  end

  def full_a
    ary=[]
    0.upto(@num) {|i|
      ary[i] = []
      @sides.times {|k| ary[i][k] = i+1 * k+1}
    }
    ary.flatten
  end

end

class MultiDice
  def initialize *dice
    
  end

  def mean
    
  end

end

class MultiStat
  def initialize *args
    @objs = args
  end
  
  def mean
    @mean ||= @objs.inject(0) { |mem, var|
      mem + var.mean*var.num
    } / @objs.inject(0) { |mem, var| mem + var.num }
  end

  def variance
    @variance ||= (@objs.inject(0) { |mem, var|
          mem + var.num*(var.variance + var.mean**2)
        } / @objs.inject(0) { |mem, var| mem + var.num }) - mean**2
  end
  
end

f = OpenStruct.new( mean: 65, variance: 4, num: 12)
m = OpenStruct.new( mean: 70, variance: 9, num: 12)
b = MultiStat.new m, f


@one_d2 = Dice.new 1, 2

@one_d3 = Dice.new 1, 3
@two_d3 = Dice.new 2, 3

# @two_d6 = Dice.new 2, 6

# brute forcing this thing....
@d4  = [1,2,3,4]                      # t
@d6  = [1,2,3,4,5,6]                  # c
@d8  = [1,2,3,4,5,6,7,8]              # o
@d12 = [1,2,3,4,5,6,7,8,9,10,11,12]   # d
@d20 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

@big_ary=[]
@d4.each do |nd4|
  @big_ary << nd4
  nd4.times { |t|

  }
end

binding.pry