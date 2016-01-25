module Perfects where

factor :: Integral a => a -> a -> Bool
x `factor` n = n `mod` x == 0

factors :: Integral a => a -> [a]
factors n = [x | x <- [1..n], x `factor` n]

perfect :: Integral a => a -> Bool
perfect n = (== n) . sum . init . factors $ n

perfects :: Integral a => a -> [a]
perfects n = [ x | x <- [1..n], perfect x]
