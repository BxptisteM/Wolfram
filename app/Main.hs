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
    parsedArgs <- parseArgs commandLineArgs
    case parsedArgs of
        Just args -> do
            validArgs <- checkArgs (Just args)
            case validArgs of
                Just _ -> do
                    putStrLn "Parsed and checked arguments:"
                    print args
                Nothing -> return ()
        Nothing -> return ()