module BabyLists where

import Data.List

append :: [a] -> [a] -> [a]
append x y = x ++ y

prepend :: a -> [a] -> [a]
prepend x y = x : y

toLower :: Char -> Char
toLower c
  | c `elem` ['A'..'Z'] = ['a'..'z'] !! (elemIndex c ['A'..'Z'])
