module Day03
    ( rectangleArea
    , overlappedInches
    , Claim(..)
    )
where

import           Data.List                      ( tails )
import           Data.Set                       ( intersection
                                                , fromList
                                                , elems
                                                , Set
                                                )
import qualified Data.Map                      as M

type Point = (Int, Int)
type Area = Set Point
type Width = Int
type Height = Int

data Claim = Claim Point Width Height

-- Part 1

rectangleArea :: Claim -> Area
rectangleArea (Claim (a, b) w h) =
    fromList [ (x, y) | x <- [(a + 1) .. (a + w)], y <- [(b + 1) .. (b + h)] ]

overlappedInches :: [Claim] -> Int
overlappedInches =
    M.size
        . M.filter (> (1 :: Int))
        . M.unionsWith (+)
        . map (M.fromSet (const 1) . rectangleArea)
