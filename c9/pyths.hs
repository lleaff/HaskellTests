module Pyths where

pyth :: Integral a => (a, a, a) -> Bool
pyth (x, y, z) = x^2 + y^2 == z^2

pyths :: Int -> [(Int, Int, Int)]
pyths n = [ (x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], pyth (x, y, z)]
