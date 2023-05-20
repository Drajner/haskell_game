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


--setFlagByName :: String -> State Flag ()
--setFlagByName flagName = 


checkInventory :: GameStatus -> String -> Bool
checkInventory status itemToCheck = itemToCheck `elem` inventory status

setPosition :: GameStatus -> String -> GameStatus
setPosition status newPosition = status {currentPosition = newPosition}

addToInventory :: GameStatus -> String -> GameStatus
addToInventory status newItem = status {inventory = newItem : inventory status}

printInventory :: GameStatus -> IO ()
printInventory status = mapM_ putStrLn (inventory status)

