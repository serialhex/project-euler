--An unbiased single 4-sided die is thrown and its value, T, is noted.
--T unbiased 6-sided dice are thrown and their scores are added together. The sum, C, is noted.
--C unbiased 8-sided dice are thrown and their scores are added together. The sum, O, is noted.
--O unbiased 12-sided dice are thrown and their scores are added together. The sum, D, is noted.
--D unbiased 20-sided dice are thrown and their scores are added together. The sum, I, is noted.
--Find the variance of I, and give your answer rounded to 4 decimal places.

import Data.Ratio
import Data.List

type Probability = Rational
type Density a = [(a, Probability)]

triple :: [a] -> [(a, Probability)]
triple as = map (\a -> (a, 3/n)) as where  n = fromIntegral (length as)

deterministic :: a -> Density a
deterministic a = [(a, 1)]

uniform :: [a] -> [(a, Probability)]
uniform as = map (\a -> (a, 1/n)) as where n = fromIntegral (length as)
d n = uniform [1..n]

foo :: (a -> Density b) -> (Density a -> Density b)
foo f da = concat (map (\(a, pa) -> map (\(b, pb) -> (b, pa*pb)) (f a)) da)

-- foo (\x -> deterministic (x*3)) (d 6)
fmap' :: (a -> b) -> (Density a -> Density b)
fmap' fa fb = foo (\x -> deterministic (fa x)) fb

--01:11 < dmwit> Or, as an alternate slightly harder problem, try to explain what "foo d (d 6)" does. =)
--01:25 < serialhex> ok, smaller #'s make life easier: `foo d (d 3)` first samples the d3, makes another die 
--                   with the roll on the die (a d1) and multiplies it by that...  then it does the same with 
--                   the next roll: a 2, and multiplies that out, giving (2,1 % 3) * [(1,1 % 2),(2,1 % 2)] = 
--                   [(1,1 % 6),(2,1 % 6)]; and so on...
--03:12 < serialhex> foo (\x -> fmap' (\y -> x+y ) (d 2) ) (d 2)

twoDn :: (Enum b, Num b) => b -> Density b
twoDn n = foo (\x -> fmap' (\y -> x+y ) (d n) ) (d n)

norm :: Ord a => Density a -> Density a
norm a  = merge lst
        where lst = sort a
              merge (x:y:rst) = if (fst x) == (fst y)
                                    then merge (((fst x), (snd x) + (snd y)):rst)
                                    else x:merge (y:rst)
              merge anythingelse  = anythingelse

--replicateM :: Int -> Density a -> Density [a]
--replicateM n m = sequence (replicate n m)


--04:20 < serialhex> so `sequence [ d 2, d 2]` should give...
--04:22 < dmwit> [([1,1],1 % 4),([1,2],1 % 4),([2,1],1 % 4),([2,2],1 % 4)]

--foo (\x -> fmap' (\y -> [y,x] ) (d 2) ) (d 2)  works!!!  now: extend!
--sequence' :: [Density a] -> Density a
--sequence' []     = []
--sequence' (a:as) = foo (\x -> fmap' (\y -> [y,x] ) a ) (sequence as)

--23:30 < dmwit> Any function that you would write as "foo [] = z; foo (x:xs) = bar x (foo xs)" can just be "foo 
--               = foldr bar z" instead.
--23:30 < dmwit> That's all there is to it.


--pair :: Density d -> Density d -> Density d
--pair a b = concat (map (\(x, px) -> map (\(y, py) -> (x:y, px*py) ) b) a )
