{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Lib
-}

module Lib (toBinArray) where

toBinArray::Int -> [Int]
toBinArray n = take (8 - length bin) (repeat 0) ++ bin
  where bin = reverse . toBin $ n

toBin::Int -> [Int]
toBin 0 = []
toBin n = n `mod` 2 : toBin (n `div` 2)