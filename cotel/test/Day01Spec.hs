module Day01Spec where

import Test.Hspec
import Test.QuickCheck
import Day01

spec = describe "Day 01 tests" $ do
    describe "Part 1 problem" $ do
        describe "sumFrequencies should return sum of array" $ do
            it "+1, +1, +1 -> 3" $
                sumFrequencies ["+1", "+1", "+1"] `shouldBe` 3
            
            it "+1, +1, -2 -> 0" $
                sumFrequencies ["+1", "+1", "-2"] `shouldBe` 0
            
            it "-1, -2, -3 -> -6" $
                sumFrequencies ["-1", "-2", "-3"] `shouldBe` -6

        describe "parseFrequency should parse positive and negative numbers" $ do
            it "parseFrequency of +x should return x" $
                parseFrequency "+12345" `shouldBe` 12345
            
            it "parseFrequency of -x should return -x" $
                parseFrequency "-12345" `shouldBe` -12345
    
    describe "Part 2 problem" $ do
        describe "firstRepeatedFrequency should return the first frequency which appears twice" $ do
            it "+1, -1 -> 0" $
                firstRepeatedFrequency ["+1", "-1"] `shouldBe` Just 0

            it "+3, +3, +4, -2, -4 -> 10" $
                firstRepeatedFrequency ["+3", "+3", "+4", "-2", "-4"] `shouldBe` Just 10

            it "-6, +3, +8, +5, -6 -> 5" $
                firstRepeatedFrequency ["-6", "+3", "+8", "+5", "-6"] `shouldBe` Just 5
            
            it "+7, +7, -2, -7, -4 -> 14" $
                firstRepeatedFrequency ["+7", "+7", "-2", "-7", "-4"] `shouldBe` Just 14