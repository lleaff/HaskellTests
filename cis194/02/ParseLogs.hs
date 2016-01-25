{-# OPTIONS_GHC -Wall #-}
module ParseLogs where

import Log
import Data.Maybe

deepCons :: a -> [[a]] -> [[a]]
y `deepCons` [] = [[y]]
y `deepCons` (x:xs) = (y:x):xs

explode :: String -> Char -> [String]
explode [] _ = []
explode (c:cs) d | c == d    = "" : explode cs d
                 | otherwise = c `deepCons` explode cs d

isUInt :: String -> Bool
isUInt = all (`elem` ['0'..'9'])

digitToInt :: Char -> Int
digitToInt c = fromJust $ lookup c (zip ['0'..'9'] [0..9])

toUInt :: String -> Int
toUInt cs | isUInt cs = foldl (\p x -> (10*p) + digitToInt x) 0 cs
          | otherwise = -1

hasValidMessageStart :: [String] -> Bool
hasValidMessageStart [] = False
hasValidMessageStart [_] = False
hasValidMessageStart (i:cs:css) | i == "I" ||
                                 i == "W" = isUInt cs
                               | i == "E" = isUInt cs && case css of
                                                              [] -> False
                                                              (cs':_) -> isUInt cs'
                               | otherwise = False

parseMessage :: String -> LogMessage
parseMessage str' | hasValidMessageStart css =
                      let (mt, ts:str) =
                            case i of
                            "I" -> (Info, ss)
                            "W" ->  (Warning, ss)
                            "E" ->  (Error (toUInt s), ss')
                            _ -> error "parseMessage: Bad message start"
                        in LogMessage mt (toUInt ts) (concat str)
                  | otherwise = Unknown str'
             where css@(i:ss@(s:ss')) = explode str' ' '


parse :: String -> [LogMessage]
parse = map parseMessage . lines
