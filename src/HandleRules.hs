{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Rules
-}

module HandleRules (RuleTable, ruleTable, findValue) where

import Data.Maybe (fromJust)

data RuleTable = RuleTable [(String, Int)] deriving (Show)

ruleTable :: [Int] -> RuleTable
ruleTable values = RuleTable (zipWith updateValue patterns values)
  where
    patterns = ["***", "** ", "* *", "*  ", " **", " * ", "  *", "   "]
    updateValue pattern value = (pattern, value)

getResult :: Eq a => a -> [(a, b)] -> Maybe b
getResult key pairs = lookup key pairs

findValue :: String -> RuleTable -> Int
findValue key (RuleTable pairs) = fromJust (getResult key pairs)