module GameStatus where

import Flag
import RoomStatus

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

setFlagInStatus :: GameStatus -> String -> GameStatus
setFlagInStatus status flagToSetName = do
    let newFlags = setFlagByName flagToSetName (getFlags status)
    status {flags = newFlags}

resetFlagInStatus :: GameStatus -> String -> GameStatus
resetFlagInStatus status flagToSetName = do
    let newFlags = resetFlagByName flagToSetName (getFlags status)
    status {flags = newFlags}

addItemToGameByRoom :: GameStatus -> String -> String -> GameStatus
addItemToGameByRoom status itemName room = do
    case findRoomStatus room (getRoomStatuses status) of
        Just rs -> status {roomStatuses = switchRoomStatus (getRoomStatuses status) (addToRoom rs itemName)}
        Nothing -> status