module Day05Spec where

import Test.Hspec
import Test.QuickCheck
import Day05

spec = describe "Day 05 Test" $ do
    describe "Part 1" $ do
        describe "processPolymer" $ do
            it "should remove reacting units from polymer" $
                processPolymer "aabBcC" `shouldBe` "aa"

            it "should leave polymer as is if there are no reacting units" $
                processPolymer "aaBBCC" `shouldBe` "aaBBCC"

        describe "remainingUnits" $
            it "should return the remaining units of a polymer after reacting it completely" $
                remainingUnits "dabAcCaCBAcCcaDA" `shouldBe` 10