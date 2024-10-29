{- CS431 Assignment #2
   Questions 12-16 Completed By Kevin Ryan (ryankc)
-}


{-12. Write a Haskell function that produces the list of the divisors of a given positive integer. 
-} 
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]


{-13.Using your function of  12.  above, write a Haskell function isPrime, from Int to Bool, that returns 
        True exactly when the argument is a prime number. 
        Recall that n is prime exactly when its list of divisors is [1, n]. 
-}
Prime :: Int -> Bool
Prime n
    | n <= 1    = False
    | n == 2    = True
    | even n    = False
    | otherwise = null [x | x <- [3,5..floor (sqrt (fromIntegral n))], n `mod` x == 0]


{-14.  Define the (infinite) list of prime numbers, using your isPrime function of  13.  above. 
        Note that this is not to be the way I defined the list of primes in my slides. 
-} 
primes :: [Int]
primes = [x | x <- [2..], isPrime x]


{-15. Show the 2000th prime number, using your list of  14.  above. 
-}
primes :: [Int]
primes = filter isPrime [2..]


{-16. A positive integer is called perfect  if it is equal to the sum of all of its divisors, excluding itself.   
For example, 6 and 28  are perfect, because  6 = 1+2+3  and 28 = 1+2+4+7+14. 
Using a list comprehension, define a Haskell function perfs from Int to [Int] 
that produces the list of all perfect numbers up to the given argument.  
-}
perfs :: Int -> [Int]
perfs limit = filter (\n -> n == sum [x | x <- [1..(n `div` 2)], n `mod` x == 0]) [1..limit]
