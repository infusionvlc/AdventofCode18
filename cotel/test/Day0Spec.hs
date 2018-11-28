module Day0Spec where

import Test.Hspec
import Test.QuickCheck
import Day0

spec = describe "Day 0 tests" $ do
    describe "cycleList" $
        it "should return a list with first item appended to the end" $
            cycleList [1,2,3] `shouldBe` [1,2,3,1]

    describe "groupByPairs" $
        it "should group a list by pairs" $
            groupByPairs [1,1,2,2] `shouldBe` [(1,1), (1,2), (2,2)]

    describe "sumEqualPairs" $ do
        it "should sum only the first element of pairs which are equal" $
            sumEqualPairs [(1,1), (2,1), (3,3)] `shouldBe` 4

        it "should return 0 if there are no pairing elements" $
            sumEqualPairs [(1,2), (2,1)] `shouldBe` 0

    describe "real problem results" $ do
        it "1122 -> 3" $
            solveProblem [1,1,2,2] `shouldBe` 3
        
        it "1111 -> 4" $
            solveProblem [1,1,1,1] `shouldBe` 4
        
        it "1234 -> 0" $
            solveProblem [1,2,3,4] `shouldBe` 0
        
        it "91212129 -> 9" $
            solveProblem [9,1,2,1,2,1,2,9] `shouldBe` 9
