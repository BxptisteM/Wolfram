{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Main
-}

module Main (main) where

import HandleArgs (parseArgs, checkArgs)
import System.Environment (getArgs)

main :: IO ()
main = do
    commandLineArgs <- getArgs
    maybeParsedArgs <- parseArgs commandLineArgs
    validArgs <- checkArgs maybeParsedArgs
    case validArgs of
      Just args -> print args
      Nothing -> return ()