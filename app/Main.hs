{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Main
-}

module Main (main) where

import HandleArgs (checkNbArgs, checkArgs, parseArgs)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    checkNbArgs args
    parsedArgs <- parseArgs args
    checkedArgs <- checkArgs parsedArgs
    case checkedArgs of
        Just a -> putStrLn $ "Arguments validés: " ++ show a