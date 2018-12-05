module Common
    ( count
    , cardinality
    , biggestValueKey
    , pickOne
    , firstDuplicate
    )
where

import qualified Data.Set                      as S
import qualified Data.Map                      as M
import           Data.Map                       ( Map )
import           Data.List
import           Data.Ord                       ( comparing )

count :: Eq a => a -> [a] -> Int
count x = length . filter (x ==)

cardinality :: Ord a => [a] -> Map a Int
cardinality xs = M.fromListWith (+) [ (x, 1) | x <- xs ]

biggestValueKey :: Ord a => Map k a -> k
biggestValueKey = fst . maximumBy (comparing snd) . M.toList

{- 
    `pickOne` returns a combination of a item of a list and all the rest.
    This way we can compare an item against the other elements of the list.

    IE:
        - [1] -> (1, [])
        - [1, 2] -> (1, [2]), (2, [1])
        - [1, 2, 3] -> (1, [2, 3]), (2, [1, 3]), (3, [1, 2])
-}
pickOne :: [a] -> [(a, [a])]
pickOne xs = [ (x, l ++ r) | (l, x : r) <- zip (inits xs) (tails xs) ]

firstDuplicate :: Ord a => [a] -> Maybe a
firstDuplicate xs = dup' xs S.empty
  where
    dup' []       _ = Nothing
    dup' (x : xs) s = if S.member x s then Just x else dup' xs (S.insert x s)
