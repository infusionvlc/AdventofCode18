module Day04
    ( Guard(..)
    , Asleep(..)
    , mostSleepingGuard
    , mostSleepingMinute
    , guardMinutesCombination
    , solveProblem
    , part2
    )
where

import           System.Environment
import           Text.Printf
import           Data.Void
import           Data.Map                       ( Map )
import qualified Data.Map                      as M
import           Data.List                      ( maximumBy
                                                , find
                                                , sortOn
                                                , findIndex
                                                )
import           Data.Ord                       ( comparing )
import           Data.Maybe                     ( fromJust )
import           Data.Time                      ( LocalTime
                                                , readSTime
                                                , defaultTimeLocale
                                                , todMin
                                                , localTimeOfDay
                                                )
import           Control.Lens.Setter            ( (.~) )
import           Control.Lens                   ( element )

data Asleep = Asleep { fromTime, toTime :: !Int }
type Id = Int
data Guard = Guard Id [Asleep]

-- Part 1

asleepPeriod :: Asleep -> Int
asleepPeriod as = (toTime as - fromTime as) - 1

asleepRange :: Asleep -> [Int]
asleepRange as = [fromTime as .. toTime as - 1]

mostSleepingGuard :: [Guard] -> Id
mostSleepingGuard gs = fst $ maximumBy
    (\(aid, asp) (bid, bsp) -> compare asp bsp)
    [ (id, (sum . map asleepPeriod) m) | (Guard id m) <- gs ]

mostSleepingMinute :: Id -> [Guard] -> Int
mostSleepingMinute gid gs =
    let (Guard id m) = fromJust $ find (\(Guard id m) -> id == gid) gs
        ranges       = concatMap asleepRange m
    in  biggestValueKey $ cardinality ranges

guardMinutesCombination :: [Guard] -> Int
guardMinutesCombination gs =
    let guardId = mostSleepingGuard gs
        minute  = mostSleepingMinute guardId gs
    in  guardId * minute

count :: Eq a => a -> [a] -> Int
count x = length . filter (x ==)

cardinality :: Ord a => [a] -> Map a Int
cardinality xs = M.fromListWith (+) [ (x, 1) | x <- xs ]

biggestValueKey :: Ord a => Map k a -> k
biggestValueKey = fst . maximumBy (comparing snd) . M.toList

-- Part 2

part2 :: [Guard] -> Int
part2 gs = id * minute
  where
    (id, minute) = biggestValueKey $ cardinality $ concatMap
        (\(Guard id as) -> [ (id, range) | range <- concatMap asleepRange as ])
        gs

-- Parsing input

data Entry = Start Int | Wake | Sleep deriving Show

parseInput :: String -> [(LocalTime, Entry)]
parseInput = sortOn fst . map parseLine . lines

parseLine :: String -> (LocalTime, Entry)
parseLine str = case readSTime True defaultTimeLocale "[%Y-%m-%d %H:%M]" str of
    [(time, descr)] -> (time, entry)
      where
        entry = case words descr of
            ["wakes", "up"    ] -> Wake
            ["falls", "asleep"] -> Sleep
            ["Guard", '#' : num, "begins", "shift"] -> Start (read num)
            _                   -> error descr
    _ -> error str

combineGuards :: [Guard] -> Guard -> [Guard]
combineGuards xs y@(Guard gid gas) =
    case findIndex (\(Guard id _) -> id == gid) xs of
        Just index -> (element index .~ Guard id (as ++ gas)) xs
            where (Guard id as) = xs !! index
        Nothing -> y : xs

getMinute :: LocalTime -> Int
getMinute = todMin . localTimeOfDay

parseGuard :: [(LocalTime, Entry)] -> [Guard]
parseGuard xs = foldl combineGuards [] (go (error "no start") xs)
  where
    go :: Int -> [(LocalTime, Entry)] -> [Guard]
    go _ ((_, Start who) : xs) = go who xs
    go who ((t1, Sleep) : (t2, Wake) : xs) =
        Guard who [Asleep (getMinute t1) (getMinute t2)] : go who xs
    go _ _ = []

solveProblem :: IO ()
solveProblem = do
    input <- readFile "inputs/Day04.txt"
    let parsedGuards        = (parseGuard . parseInput) input
    let mostSleepingGuardId = mostSleepingGuard parsedGuards
    let mostSleptMinute = mostSleepingMinute mostSleepingGuardId parsedGuards
    let finalResult         = mostSleptMinute * mostSleepingGuardId
    putStrLn "Part 1 -----"
    putStrLn ("Most sleeping guard id is " ++ show mostSleepingGuardId)
    putStrLn ("Most slept minute is " ++ show mostSleptMinute)
    putStrLn ("Final result is " ++ show finalResult)
    putStrLn ""
    putStrLn "Part 2 -----"
    putStrLn ("Final result is " ++ show (part2 parsedGuards))
