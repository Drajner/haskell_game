module GameStatus where

import CurrentPosition
import Flag
import Inventory
import RoomStatus
import Control.Monad.State

data GameStatus = GameStatus
    { currentPosition :: String
    , flags :: [Flag]
    , inventory :: [String]
    , roomStatuses :: [RoomStatus]
    }

getPosition :: GameStatus -> String
getPosition = currentPosition

getFlags :: GameStatus -> [Flag]
getFlags = flags

getInventory :: GameStatus -> [String]
getInventory = inventory

getRoomStatuses :: GameStatus -> [RoomStatus]
getRoomStatuses = roomStatuses



setPosition :: GameStatus -> String -> GameStatus
setPosition status newPosition = status {currentPosition = newPosition}

checkInventory :: GameStatus -> String -> Bool
checkInventory status itemToCheck = itemToCheck `elem` inventory status

addToInventory :: GameStatus -> String -> GameStatus
addToInventory status newItem = status {inventory = newItem : inventory status}

removeFromInventory :: GameStatus -> String -> GameStatus
removeFromInventory status itemToGo = status {inventory = filter (/=itemToGo) (inventory status)}

printInventory :: GameStatus -> IO ()
printInventory status = mapM_ putStrLn (inventory status)

