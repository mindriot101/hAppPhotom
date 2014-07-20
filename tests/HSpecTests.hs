module Main where

import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "It does stuff" $ do
        it "does stuff" $ do
            1 `shouldBe` 1
