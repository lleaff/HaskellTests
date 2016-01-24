module BabyType where

type Name = String
type Head = Char
type Body = Char

data Snailnimal = Snail Name Head Body
                | DeadSnail Name

instance Show Snailnimal where
  show (Snail name shead body) =
            show ([body, shead] ++ " <= " ++ name ++ " the snail")
  show (DeadSnail name) =
            show ("+ <= Late " ++ name ++ " the snail")
    -- ✝

kill :: Snailnimal -> Snailnimal
kill (Snail name _ _) = DeadSnail name
kill dead = dead 

charlie :: Snailnimal
charlie = Snail "Charlie" 'o' '@'

bobby :: Snailnimal
bobby = DeadSnail "Bobby"
