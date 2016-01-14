module Creditcard where

import Prelude hiding (replicate, (/))

-- Exercise 1

(/) :: Integer -> Integer -> Integer
x / y = x `div` y

dropLastDigit :: Integer -> Integer
dropLastDigit = (/10)

lastDigit :: Integer -> Integer
lastDigit = (`mod` 10)

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n == 0    = []
  | otherwise = lastDigit n : [dropLastDigit n]


toDigits :: Integer -> [Integer]
toDigits n = reverse (toDigitsRev n)


-- Exercise 2

replicate :: Int -> a -> [a]
replicate n x = take n (repeat x)

repeatEvery :: a -> Int -> a -> [a]
repeatEvery fill n x = replicate (n - 1) fill ++ [x] ++ repeatEvery fill n x
 
mapAtEvery :: (a -> b) -> Int -> (a -> b) -> [a] -> [b]
mapAtEvery fill n f =  zipWith ($) (repeatEvery fill n f)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . mapAtEvery id 2 (2*) . reverse
