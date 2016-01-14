module BabyLists where

import Data.Char (chr, ord)

append :: [a] -> [a] -> [a]
append x y = x ++ y

prepend :: a -> [a] -> [a]
prepend x y = x : y

isLower :: Char -> Bool
isLower c = ordc >= loUp && ordc <= hiUp
    where ordc = ord c
          loUp = ord 'A'
          hiUp = ord 'Z'

toLower :: Char -> Char
toLower c
    | isLower c = chr (ordc - loUp + loLo)
    | otherwise = c
    where ordc = ord c
          loUp = ord 'A'
          loLo = ord 'a'
