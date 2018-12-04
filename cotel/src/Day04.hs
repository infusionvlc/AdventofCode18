module Day04 where

import           Data.Map                       ( Map )
import qualified Data.Map                      as M
import           Data.List                      ( maximumBy, find )
import Data.Maybe (fromJust)

data Asleep = Asleep { fromTime, toTime :: !Int }
type Id = Int
data Guard = Guard Id (Map String [Asleep])

-- Part 1

asleepPeriod :: Asleep -> Int
asleepPeriod as = (toTime as - fromTime as) - 1

asleepRange :: Asleep -> [Int]
asleepRange as = [fromTime as .. toTime as - 1 ]

mostSleepingGuard :: [Guard] -> Id
mostSleepingGuard gs = fst $ maximumBy
    (\(aid, asp) (bid, bsp) -> compare asp bsp)
    [ (id, (sum . map asleepPeriod . concat . M.elems) m) | (Guard id m) <- gs ]

mostSleepingMinute :: Id -> [Guard] -> Int
mostSleepingMinute gid gs = let
    (Guard id m) = fromJust $ find (\(Guard id m) -> id == gid) gs
    ranges = (map asleepRange . concat . M.elems) m
    in M.unionsWith (+) [ M.fromList r | r <- ranges ]

count :: Eq a => a -> [a] -> Int
count x = lengt . filter (x==)

