{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- HandleArgs
-}

module HandleArgs (Args, checkNbArgs, checkArgs, parseArgs) where

import System.Exit (exitWith, ExitCode(ExitFailure))

data Args = Args { rule :: Maybe Int, start :: Maybe Int, nbLines :: Maybe Int, window :: Maybe Int, move :: Maybe Int } deriving (Show)

checkNbArgs :: [String] -> IO ()
checkNbArgs args
    | null args = exitWith (ExitFailure 84)
    | otherwise = return ()

checkArgs :: Maybe Args -> IO (Maybe Args)
checkArgs Nothing = exitWith (ExitFailure 84)
checkArgs (Just args) = return (Just args)

parseArgs :: [String] -> IO (Maybe Args)
parseArgs args = do
    let ruleValue = fmap read $ getArgValue "--rule" args :: Maybe Int
    case ruleValue of
        Just r -> if r `elem` [30, 90, 110]
            then return $ Just $ getValues args
            else exitWith (ExitFailure 84)
        Nothing -> exitWith (ExitFailure 84)

getValues :: [String] -> Args
getValues args = Args {
    rule = fmap read $ getArgValue "--rule" args,
    start = Just $ maybe 0 read (getArgValue "--start" args),
    nbLines = fmap read $ getArgValue "--lines" args,
    window = Just $ maybe 80 read (getArgValue "--window" args),
    move = fmap read $ getArgValue "--move" args
}

getArgValue :: String -> [String] -> Maybe String
getArgValue argName args = case dropWhile (/= argName) args of
    (_:val:_) -> Just val
    _ -> Nothing