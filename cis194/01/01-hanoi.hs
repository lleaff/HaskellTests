type Peg = String
type Move = (Peg, Peg)

move :: Peg -> Peg -> Move
move a b = (a, b)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n a b c
  | n == 1    = [move a b]
  | otherwise = hanoi (n - 1) a c b ++ [move a b] ++ hanoi (n - 1) c b a

main :: IO()
main = print (hanoi 2 "a" "b" "c") >>
       print (hanoi 3 "a" "b" "c")
