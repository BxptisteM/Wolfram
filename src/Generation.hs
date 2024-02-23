{-
-- EPITECH PROJECT, 2024
-- Wolfram [WSL: Ubuntu]
-- File description:
-- Generation
-}

module Generation (positiveGeneration, negativeGeneration) where
import HandleRules (RuleTable, findValue)
import Lib (convertIC)
import System.Exit (exitWith, ExitCode(..))

generateLeft::[Int] -> RuleTable -> [Int]
generateLeft xs ruleTab = findValue
    (convertIC (reverse (take 3 xs))) ruleTab : generateLeft (tail xs) ruleTab

generateRight::[Int] -> RuleTable -> [Int]
generateRight xs ruleTab =
    findValue (convertIC (take 3 xs)) ruleTab : generateRight (tail xs) ruleTab

generateLists :: Int -> Maybe Int -> Int -> Int -> RuleTable -> [Int] -> [Int] -> IO ()
generateLists window nbLines countLines start ruleTab ys zs
    | start > 0 = handleStart window nbLines countLines
                    (start - 1) ruleTab ys zs
    | otherwise = checkNbLines window nbLines countLines ruleTab ys zs

handleStart :: Int -> Maybe Int -> Int -> Int -> RuleTable -> [Int] -> [Int] -> IO ()
handleStart window nbLines countLines start ruleTab ys zs =
    generateLists window nbLines countLines start ruleTab
        (generateLeft ((head zs):ys) ruleTab)
        (generateRight ((head ys):zs) ruleTab)

checkNbLines :: Int -> Maybe Int -> Int -> RuleTable -> [Int] -> [Int] -> IO ()
checkNbLines window (Just n) countLines ruleTab ys zs
    | countLines >= n = exitWith ExitSuccess
    | otherwise = displayWolfram window (Just n) countLines ruleTab ys zs
checkNbLines window Nothing countLines ruleTab ys zs =
    displayWolfram window Nothing countLines ruleTab ys zs

displayWolfram :: Int -> Maybe Int -> Int -> RuleTable -> [Int] -> [Int] -> IO ()
displayWolfram window nbLines countLines ruleTab ys zs =
    putStr (reverse (convertIC (take window ys))) >>
    putStrLn (convertIC (take window zs)) >>
    generateLists window nbLines (countLines + 1) 0 ruleTab
        (generateLeft ((head zs):ys) ruleTab)
        (generateRight ((head ys):zs) ruleTab)

positiveGeneration::Int -> Int -> Maybe Int -> Int -> Int -> RuleTable -> IO ()
positiveGeneration move window nbLines countLines start ruleTbl =
    generateLists window nbLines countLines start ruleTbl (repeat 0)
    (replicate move 0 ++ [1] ++ repeat 0)

negativeGeneration::Int -> Int -> Maybe Int -> Int -> Int -> RuleTable -> IO ()
negativeGeneration move window nbLines countLines start ruleTbl =
    generateLists window nbLines countLines start ruleTbl
        (replicate ((abs move) -1) 0 ++ [1] ++ repeat 0) (repeat 0)