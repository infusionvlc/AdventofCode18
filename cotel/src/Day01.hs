module Day01
    ( sumFrequencies
    , parseFrequency
    , firstRepeatedFrequency
    , firstDuplicate
    )
where

import qualified Data.Set                      as Set
import           Common

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
