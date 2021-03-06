module Day03
    ( rectangleArea
    , overlappedInches
    , notOverlappedClaimId
    , Claim(..)
    )
where

import           Common
import           Data.List                      ( tails
                                                , inits
                                                )
import           Data.Set                       ( intersection
                                                , fromList
                                                , elems
                                                , intersection
                                                , null
                                                , Set
                                                )
import qualified Data.Map                      as M

type Point = (Int, Int)
type Area = Set Point
type Width = Int
type Height = Int
type Id = Int

data Claim = Claim Id Point Width Height

-- Part 1

rectangleArea :: Claim -> Area
rectangleArea (Claim id (a, b) w h) =
    fromList [ (x, y) | x <- [(a + 1) .. (a + w)], y <- [(b + 1) .. (b + h)] ]

overlappedInches :: [Claim] -> Int
overlappedInches = M.size . M.filter (> (1 :: Int)) . M.unionsWith (+) . map
    (M.fromSet (const 1) . rectangleArea)

-- Part 2

idFromClaim :: Claim -> Id
idFromClaim (Claim id _ _ _) = id

notOverlappedClaimId :: [Claim] -> Int
notOverlappedClaimId cs = head
    [ i
    | let zs = [ (idFromClaim c, rectangleArea c) | c <- cs ]
    , ((i, x), xs) <- pickOne zs
    , all (disjoint x) (map snd xs)
    ]

disjoint :: Ord a => Set a -> Set a -> Bool
disjoint s1 s2 = Data.Set.null (intersection s1 s2)
