{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Main
-}

module Main (main) where

import System.Environment (getArgs)
import HandleArgs (Args, parseArgs, checkArgs)
import Rules (RuleTable, ruleTable)
import Lib (toBinArray)

main :: IO ()
main = do
  args <- getArgs
  parsedArgs <- parseArgs args
  checkedArgs <- checkArgs parsedArgs

  case checkedArgs of
    Just args -> do
      let ruleValue = maybe 30 id (rule args) -- Correction ici pour utiliser 'rule' correctement
      let binaryArray = toBinArray ruleValue

      putStrLn "Binary Array:"
      print binaryArray

      let rules = ruleTable binaryArray

      putStrLn "Rule Table:"
      print rules
    Nothing -> putStrLn "No valid arguments provided."
