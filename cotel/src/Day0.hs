module Day0
    ( cycleList
    , groupByPairs
    , sumEqualPairs
    , solveProblem
    ) where

import Data.Tuple

cycleList :: [a] -> [a]
cycleList xs = xs ++ (take 1 xs)

groupByPairs :: [a] -> [(a, a)]
groupByPairs xs = zip xs (drop 1 xs)

sumEqualPairs :: (Num a, Eq a) => [(a, a)] -> a
sumEqualPairs xs = sum [x | (x, y) <- xs, x == y]

solveProblem :: (Num a, Eq a) => [a] -> a
solveProblem xs = let pairedCycledList = (groupByPairs . cycleList) xs
    in sumEqualPairs pairedCycledList
