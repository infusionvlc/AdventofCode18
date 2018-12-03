module Day03Spec where

import Data.Set (elems)

import Test.Hspec
import Test.QuickCheck
import Day03

spec = describe "Day 03 tests" $ do
    describe "Part 1" $ do
        describe "rectangleArea" $
            it "should parse input correctly into Area of rectangle" $
                elems (rectangleArea (Claim (3, 2) 5 4)) `shouldMatchList` [(4, 3), (5, 3), (6, 3), (7, 3), (8, 3),
                                                            (4, 4), (5, 4), (6, 4), (7, 4), (8, 4),
                                                            (4, 5), (5, 5), (6, 5), (7, 5), (8, 5),
                                                            (4, 6), (5, 6), (6, 6), (7, 6), (8, 6)]   

        {- describe "intersectionAreas" $
            it "should return common points between two areas" $
                intersectionAreas [[(1, 2), (1, 3), (1, 4)], [(1, 3), (1, 4), (1, 5)]] `shouldMatchList` [(1, 3), (1, 4)] -}

        describe "overlappedInches" $
            it "example problem should return 4" $
                overlappedInches [(Claim (1, 3) 4 4), (Claim (3, 1) 4 4), (Claim (5, 5) 2 2)] `shouldBe` 4