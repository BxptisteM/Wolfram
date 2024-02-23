{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- HandleArgs
-}

module HandleArgs (Args(..), checkArgs, parseArgs, getRule, getMove, getWindowSize, getStart, getNbLines) where

import Data.Maybe (isJust, fromJust)
import System.Exit (exitWith, ExitCode(ExitFailure))
import Text.Read (readMaybe)

data Args = Args {rule :: Maybe Int, start :: Maybe Int, nbLines :: Maybe Int, window :: Maybe Int, move :: Maybe Int} deriving (Show)

defaultArgs::Args
defaultArgs = Args {
    rule = Nothing,
    start = Just 0,
    nbLines = Nothing,
    window = Just 80,
    move = Just 0
}

checkArgs::Maybe Args -> IO (Maybe Args)
checkArgs (Just args) =
    if isJust (rule args) && fromJust (rule args) `elem` [30, 90, 110]
    then return (Just args)
    else exitWithError
checkArgs Nothing = exitWithError

exitWithError::IO (Maybe Args)
exitWithError = putStrLn "Error: Invalid argument or value."
                >> exitWith (ExitFailure 84)

parseArgs::[String] -> IO (Maybe Args)
parseArgs args = parseArgsHelper args defaultArgs

parseArgsHelper::[String] -> Args -> IO (Maybe Args)
parseArgsHelper [] args = return $ Just args
parseArgsHelper ("--rule":val:rest) args =
    case readMaybe val :: Maybe Int of
        Just n -> parseArgsHelper rest args{rule = Just n}
        Nothing -> exitWithError
parseArgsHelper ("--start":val:rest) args =
    case readMaybe val :: Maybe Int of
        Just n | n >= 0 -> parseArgsHelper rest args{start = Just n}
        _ -> exitWithError
parseArgsHelper ("--lines":val:rest) args =
    case readMaybe val :: Maybe Int of
        Just n | n >= 0 -> parseArgsHelper rest args{nbLines = Just n}
        _ -> exitWithError
parseArgsHelper ("--window":val:rest) args =
    case readMaybe val :: Maybe Int of
        Just n | n >= 0 -> parseArgsHelper rest args{window = Just n}
        _ -> exitWithError
parseArgsHelper ("--move":val:rest) args =
    case readMaybe val :: Maybe Int of
        Just n -> parseArgsHelper rest args{move = Just n}
        _ -> exitWithError
parseArgsHelper _ _ = exitWithError

getRule::Args -> Maybe Int
getRule args = rule args

getMove::Args -> Int
getMove args = fromJust (move args)

getWindowSize::Args -> Int
getWindowSize args = fromJust (window args)

getStart::Args -> Int
getStart args = fromJust (start args)

getNbLines::Args -> Maybe Int
getNbLines args = nbLines args
