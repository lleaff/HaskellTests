module Chapter02 where

(|||) :: Bool -> Bool -> Bool
True ||| _  = True
False ||| b = b
-- https://www.haskell.org/onlinereport/decls.html#fixity
infixr 2 |||

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)

mylength :: [a] -> Integer
mylength (_:xs) = 1 + mylength xs
mylength [] = 0

mynull :: [a] -> Bool
mynull [] = True
mynull _  = False


mydrop' :: Integral a => a -> [a] -> [a]
mydrop' n ls = if n <= 0 ||| mynull ls
              then ls
              else mydrop' (n - 1) (tail ls)

mydrop :: Integral b => b -> [a] -> [a]
mydrop n (x:xs)
    | n <= 0    = x:xs
    | otherwise = mydrop (n -1) xs
mydrop _ [] = []

(%) :: Integral a => a -> a -> a
x % y = x - ((x `div` y) * y)

lastButOne :: [a] -> a
lastButOne [x, _] = x
lastButOne (_:xs) = lastButOne xs
lastButOne _      = error "Chapter02.lastButOne: list is too short (2 minimum)"

safeLast :: [a] -> Maybe a
safeLast []     = Nothing
safeLast (x:[]) = Just x
safeLast (_:xs) = safeLast xs
