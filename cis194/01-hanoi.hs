module Hanoi where

type Peg = String
type Move = (Peg, Peg)

move :: Peg -> Peg -> Move
move a b = (a, b)


hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n a b c = ''
