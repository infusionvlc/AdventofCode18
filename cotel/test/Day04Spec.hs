module Day04Spec where

import Test.Hspec
import Test.QuickCheck
import Day04

spec = describe "Day 04 Tests" $ do

    let exampleInput = [Guard 10 [Asleep 05 25, Asleep 30 55, Asleep 24 29], Guard 99 [Asleep 40 50, Asleep 36 46, Asleep 45 55]]

    describe "Part 1" $ do
        describe "mostSleepingGuard" $
            it "should return the id of the most sleeping guard" $
                mostSleepingGuard exampleInput `shouldBe` 10

        describe "mostSleepingMinute" $
            it "should return the most repeating minute in which the guard was sleeping" $
                mostSleepingMinute 10 exampleInput `shouldBe` 24

        describe "guardMinutesCombination" $
            it "example input should return 240" $
                guardMinutesCombination exampleInput `shouldBe` 240

    describe "Part 2" $
        it "example input should return 4455" $
            part2 exampleInput `shouldBe` 4455
