module Inventory where
import Control.Monad.State

type Inventory = [String]

addToInventory :: String -> State Inventory ()
addToInventory newItem = modify(\s -> s ++ [newItem])

printInventory :: Inventory -> IO ()
printInventory = mapM_ putStrLn

