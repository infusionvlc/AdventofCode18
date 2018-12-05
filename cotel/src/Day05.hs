module Day05
    ( processPolymer
    , remainingUnits
    , bestCollapsedPolymer
    )
where

import           Common
import           Data.Char
import qualified Data.Set                      as S
import           Data.Set                       ( Set )

-- Part 1

type Polymer = String

processPolymer :: Polymer -> Polymer
processPolymer = go
  where
    go []  = []
    go [x] = [x]
    go (x : y : xs) =
        if abs (ord x - ord y) == 32 then go xs else x : go (y : xs)

remainingUnits :: Polymer -> Int
remainingUnits xs = go (length xs) (processPolymer xs)
  where
    go l xs = if l == length xs then l else go (length xs) (processPolymer xs)

-- Part 2

uniqueUnits :: Polymer -> Set Char
uniqueUnits = S.fromList . map toLower

polymersWithoutChars :: Polymer -> Set Char -> [Polymer]
polymersWithoutChars pol chars =
    [ filter (\a -> abs (ord a - ord c) /= 32) pol | c <- S.elems chars ]

bestCollapsedPolymer :: Polymer -> Int
bestCollapsedPolymer pol =
    let 
        chars = uniqueUnits pol
        allPols = polymersWithoutChars pol chars
    in  minimum [ remainingUnits p | p <- allPols ]


