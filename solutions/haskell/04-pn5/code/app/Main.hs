module Main (main) where

import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStr "$ "
    hFlush stdout
    command <- getLine
    if command == "exit"
        then pure ()
        else do
            putStrLn $ command ++ ": command not found"
            main
