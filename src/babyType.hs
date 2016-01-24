module BabyType where

type Name = String
type Head = Char
type Body = Char

data Snailnimal = Snail Name Head Body

instance Show Snailnimal where
  show (Snail name shead body) =
    show ([body, shead] ++ " <= " ++ name ++ " the snail")

charlie :: Snailnimal
charlie = Snail "Charlie" 'o' '@'
