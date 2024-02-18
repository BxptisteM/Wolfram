{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Main
-}

module Main (main) where

import System.Environment (getArgs)


main :: IO ()
main = do
    args <- getArgs
    print args