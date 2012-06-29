{-
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
-}


findMults n m s = if n `mod` m[1] -- this definitely needs to change!
                  then findMults (n-1) m (s+m)
                  else findMults (n-1) m s