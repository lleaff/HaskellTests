module Chapter02 where

(|||) :: Bool -> Bool -> Bool
True ||| _  = True
False ||| b = b

mylength :: [a] -> Integer
mylength (_:xs) = 1 + mylength xs
mylength [] = 0

mynull :: [a] -> Bool
mynull [] = True
mynull _  = False


{- mydrop :: Integral a => a -> [a] -> [a]
mydrop n ls = if n <= 0 ||| mynull ls
              then ls
              else mydrop (n - 1) (tail ls) -}

mydrop :: Integral b => b -> [a] -> [a]
mydrop n (x:xs)
    | n <= 0    = x:xs
    | otherwise = mydrop (n -1) xs
mydrop _ [] = []

(%) :: Integral a => a -> a -> a
x % y = x - ((x `div` y) * y)
