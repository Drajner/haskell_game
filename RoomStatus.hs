module RoomStatus where

import Control.Monad.State
import Data.List

type RoomStatus = [String]

removeFromRoom :: String -> State RoomStatus ()
removeFromRoom itemToGo = modify(\s -> delete itemToGo s)

addToRoom :: String -> State RoomStatus ()
addToRoom newItem = modify(\s -> s ++ [newItem])

printRoomStatus :: RoomStatus -> IO ()
printRoomStatus = mapM_ putStrLn

{-}
main = do
    let rs = ["jeden","dwa"]
    printRoomStatus rs
    let ((),newRs) = runState (removeFromRoom "dwa") rs
    printRoomStatus newRs
-}
