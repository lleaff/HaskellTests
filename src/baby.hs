module Baby where

doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y

myMin :: Ord a => a -> a -> a
myMin x y = if x < y then x else y

factorial :: Integral a => a -> a
factorial x
  | x < 1 = 0
  | x == 1 = 1
  | otherwise = x * factorial (x - 1)
