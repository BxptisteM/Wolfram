{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Main
-}

module Main (main) where

import System.Environment (getArgs)
import HandleArgs (checkArgs, parseArgs, getRule, getMove, getWindowSize, getStart, getNbLines, Args(..))
import HandleRules (ruleTable)
import Lib (toBinArray)
import Generation (positiveGeneration, negativeGeneration)

main :: IO ()
main = getArgs >>= parseArgs >>= checkArgs >>= maybe (return ()) startWolfram

startWolfram :: Args -> IO ()
startWolfram args = case getRule args of
    Just r -> let binaryRuleArray = toBinArray r
                  ruleTbl = ruleTable binaryRuleArray
              in if getMove args == 0 || getMove args > 0
                 then positiveGeneration (getMove args) (getWindowSize args)
                    (getNbLines args) 0 (getStart args) ruleTbl
                 else negativeGeneration (getMove args) (getWindowSize args)
                    (getNbLines args) 0 (getStart args) ruleTbl
    Nothing -> return ()