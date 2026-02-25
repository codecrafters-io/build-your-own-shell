module Main (main) where

import Data.List (isPrefixOf)
import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStr "$ "
    hFlush stdout
    command <- getLine
    if command == "exit"
        then pure ()
        else do
            if "echo " `isPrefixOf` command
                then putStrLn (drop 5 command)
                else putStrLn $ command ++ ": command not found"
            main
