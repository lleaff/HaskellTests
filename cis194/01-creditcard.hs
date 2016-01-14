module Creditcard where

import Prelude hiding (replicate, (/), sum)

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

-- Exercise 3

sum :: [Integer] -> Integer
sum = foldl (+) 0

flatten :: [[a]] -> [a]
flatten ([x]:ys) = x : flatten  ys
flatten ((z:ys):ws) = z : flatten [ys] ++ flatten ws
flatten ([]:ys) = flatten ys
flatten [] = []

flatMap :: (a -> [a]) -> [a] -> [a]
flatMap f ls = flatten (map f ls)

sumDigits :: [Integer] -> Integer
sumDigits = sum . flatMap toDigits
