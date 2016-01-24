module BabyType where

import Data.Char

------------------------------------------------------------

type Name = String
type Head = Char
type Body = Char

data Snailnimal = Snail Name Head Body
                | BabySnail Name Head
                | DeadSnail Name

getName :: Snailnimal -> Name
getName (Snail name _ _) = name
getName (BabySnail name _) = name
getName (DeadSnail name) = name

instance Show Snailnimal where
  show (Snail name shead body) =
            show ([body, shead] ++ " <= " ++ name ++ " the snail")
  show (BabySnail name shead) =
            show ([shead] ++ " <= " ++ name ++ " the baby snail")
  show (DeadSnail name) =
            show ("+ <= Late " ++ name ++ " the snail")
    -- ✝

match :: Snailnimal -> Snailnimal -> Snailnimal
match (Snail name shead _) (Snail name' shead' _') =
    BabySnail (matchNames name name') (matchHeads shead shead')
match _ _ = error "match: Can't do that"

grow :: Snailnimal -> Snailnimal
grow (BabySnail name shead) = Snail name shead (middleChar 'A' shead)
grow (Snail name _ _) = DeadSnail name
grow (DeadSnail _) = error "grow: Can't do that"

kill :: Snailnimal -> Snailnimal
kill snail = DeadSnail (getName snail)

------------------------------------------------------------

passThrough :: (a -> b) -> (b -> b -> c) -> a -> a -> c
passThrough f f' x y = f' (f x) (f y)

middle :: Integral a => a -> a -> a
middle x = (+ x) . (`div` 2) . (-x +)

middleChar :: Char -> Char -> Char
middleChar h = chr . passThrough ord middle h

pair :: a -> a -> [a]
pair x y = [x, y]

weave :: [a] -> [a] -> [a]
weave xs ys = concat (zipWith pair xs ys)

compress :: [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:zs) = x : compress (tail zs)

capitalize :: String -> String
capitalize (c:cs) = toUpper c : map toLower cs
capitalize "" = ""

matchNames :: String -> String -> String
matchNames x y = capitalize (weave (compress x) (reverse (compress y)))

matchHeads = middleChar

------------------------------------------------------------

charlie = Snail "Charlie" 'o' '@'

julie = Snail "Julie" 'u' 'O'

bobby = DeadSnail "Bobby"
