module MessageTree where

import Log

insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) mTree = mTree
insert logMessage Leaf = Node Leaf logMessage Leaf
insert _ (Node _ (Unknown _) _) = error "insert: 'Unknown' log in tree."
insert msg@(LogMessage _ timeSp _) (Node mTreeL msg'@(LogMessage _ timeSp' _) mTreeR)
  | timeSp < timeSp' = Node (insert msg mTreeL) msg' mTreeR
  | otherwise        = Node mTreeL msg' (insert msg mTreeR)

build :: [LogMessage] -> MessageTree
build = foldr insert Leaf
