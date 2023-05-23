module Reading where

    -- print strings from list in separate lines
printLines :: [String] -> IO ()
printLines xs = putStr (unlines xs)
