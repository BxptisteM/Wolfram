{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Rules
-}

module Rules (RuleTable, ruleTable) where

data RuleTable = RuleTable [(String, Int)] deriving (Show)

ruleTable :: [Int] -> RuleTable
ruleTable values = RuleTable (zipWith updateValue patterns values)
  where
    patterns = ["***", "** ", "* *", "*  ", " **", " * ", "  *", "   "]
    updateValue pattern value = (pattern, value)

