module Day01
    ( sumFrequencies
    , parseFrequency
    , firstRepeatedFrequency
    )
where

import qualified Data.Set                      as Set

-- Part 1

sumFrequencies :: [String] -> Int
sumFrequencies = sum . map parseFrequency

parseFrequency :: String -> Int
parseFrequency ('-' : xs) = let freq = read xs :: Int in freq * (-1)
parseFrequency ('+' : xs) = read xs :: Int

-- Part 2

firstRepeatedFrequency :: [String] -> Maybe Int
firstRepeatedFrequency xs =
    let infiniteXs = (cycle . map parseFrequency) xs
    in  firstDuplicate (scanl (+) 0 infiniteXs)

firstDuplicate :: Ord a => [a] -> Maybe a
firstDuplicate xs = dup' xs Set.empty
  where
    dup' [] _ = Nothing
    dup' (x : xs) s =
        if Set.member x s then Just x else dup' xs (Set.insert x s)
