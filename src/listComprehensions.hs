module ListComprehensions where

sssh :: String -> String
sssh str = [c | c <- str, (not . elem c) ['A'..'Z']]

