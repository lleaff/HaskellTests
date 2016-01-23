module Pairs where

pairs :: [a] -> [(a, a)]
pairs (x:y:xs) = (x, y) : pairs (y : xs)
pairs [_] = []
pairs [] = []

pairs' :: [a] -> [(a, a)]
pairs' xs = (head xs, head (tail xs)) : pairs (tail xs)
