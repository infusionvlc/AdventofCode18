module Day05Spec where

import Test.Hspec
import Test.QuickCheck
import Day05
import Data.Set (fromList)

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

    describe "Part 2" $ do
        describe "uniqueUnits" $
            it "should return a Set of unique characters in a polymer" $
                uniqueUnits "aabcdefeeg" `shouldBe` fromList "abcdefg"

        describe "polymersWithoutChars" $
            it "should return a list of polymers without characters" $
                polymersWithoutChars "abcd" (fromList "abcd") `shouldMatchList` ["bcd", "acd", "abd", "abc"]

        describe "bestCollapsedPolymer" $
            it "should return the length of the most collapsed polymer" $
                bestCollapsedPolymer "dabAcCaCBAcCcaDA" `shouldBe` 4