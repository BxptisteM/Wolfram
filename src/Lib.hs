{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Lib
-}

module Lib (toBinArray, convertIC) where

toBinArray::Int -> [Int]
toBinArray n = take (8 - length bin) (repeat 0) ++ bin
  where bin = reverse . toBin $ n

toBin::Int -> [Int]
toBin 0 = []
toBin n = n `mod` 2 : toBin (n `div` 2)


convertIC::[Int] -> [Char]
convertIC [] = []
convertIC (x:xs) = if x == 0 then ' ' : convertIC xs else '*' : convertIC xs