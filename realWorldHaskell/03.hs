module DefiningTypesStreamliningFunctions where

-- Ex 3

mean :: Num a => [a] -> Maybe a
mean [] = Nothing
mean xs =  Just (sum xs `div` fromInteger (length xs))

-- Ex 4

palindrome :: [a] -> [a]
palindrome ls = ls ++ reverse ls
