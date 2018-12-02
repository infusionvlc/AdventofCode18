module Day02
    ( checksum
    , tupleAppearances
    , fullChecksum
    , commonLettersOfCorrectIds
    , commonLetters
    )
where

import           Data.List                      ( elemIndices )
import           Data.Maybe                     ( isJust
                                                , fromJust
                                                )

-- Part 1

tupleAppearances :: String -> (Int, Int)
tupleAppearances xs | 2 `elem` appearances && 3 `elem` appearances = (1, 1)
                    | 2 `elem` appearances = (1, 0)
                    | 3 `elem` appearances = (0, 1)
                    | otherwise            = (0, 0)
    where appearances = [ length (elemIndices x xs) | x <- xs ]

checksum :: (Int, Int) -> Int
checksum (x, y) = x * y

instance Semigroup Int where
    (<>) x y = x + y

fullChecksum :: [String] -> Int
fullChecksum xs = checksum $ foldl (<>) (0, 0) (map tupleAppearances xs)

-- Part 2

commonLetters :: String -> String -> Maybe String
commonLetters xs ys = fmap reverse (go xs ys [] 0 0)
  where
    go xs ys rs pos rep
        | rep > 1                    = Nothing
        | length xs <= pos           = Just rs
        | (xs !! pos) == (ys !! pos) = go xs ys ((xs !! pos) : rs) (pos + 1) rep
        | otherwise                  = go xs ys rs (pos + 1) (rep + 1)

commonLettersOfCorrectIds :: [String] -> String
commonLettersOfCorrectIds xs = (head . filter differInOneLetter)
    [ fromJust mzs | x <- xs, y <- xs, let mzs = commonLetters x y, isJust mzs ]
  where
    wordLength = (length . head) xs
    differInOneLetter zs = wordLength - length zs == 1
