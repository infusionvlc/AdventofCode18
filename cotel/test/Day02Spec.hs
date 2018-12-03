module Day02Spec where

import Test.Hspec
import Test.QuickCheck
import Day02

spec = describe "Day 02 tests" $ do
    describe "Part 1" $ do
        describe "checksum should multiplicate elements of a tuple" $
            it "(4, 4) should return 16" $
                checksum (4, 4) `shouldBe` 16

        describe "tupleAppearances" $ do
            it "should return (1, 0) if there is a word appearing twice" $
                tupleAppearances "abcdee" `shouldBe` (1, 0)

            it "should return (0, 1) if there is a word appearing thrice" $
                tupleAppearances "abcccdbb" `shouldBe` (0, 1)

            it "should return (1, 1) if there both conditions meet" $
                tupleAppearances "bababc" `shouldBe` (1, 1)

            it "should return (0, 0) if no condition is met" $
                tupleAppearances "abcdef" `shouldBe` (0, 0)

        describe "fullChecksum" $
            it "example checksum should be 12" $
                fullChecksum ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"] `shouldBe` 12

    describe "Part 2" $ do
        describe "commonLetters" $ do
            it "should return Nothing from abcde and abxyc" $
                commonLetters "abcde" "abxyc" `shouldBe` Nothing
            
            it "should return Just fgij from fghij and fguij" $
                commonLetters "fghij" "fguij" `shouldBe` Just "fgij"

        describe "commonLettersOfCorrectIds" $
            it "example commonLetters are fgij" $
                commonLettersOfCorrectIds ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"] `shouldBe` "fgij"
