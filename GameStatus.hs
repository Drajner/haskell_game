module GameStatus where

import CurrentPosition
import Flag
import Inventory
import RoomStatus
import Control.Monad.State

data GameStatus = GameStatus
    { currentPosition :: CurrentPosition
    , flags :: [Flag]
    , inventory :: Inventory
    , roomStatuses :: [RoomStatus]
    }

getFlags :: State GameStatus [Flag]
getFlags = gets flags

getCurrentPosition :: State GameStatus CurrentPosition
getCurrentPosition = gets currentPosition

getInventory :: State GameStatus Inventory
getInventory = gets inventory

getRoomStatuses :: State GameStatus [RoomStatus]
getRoomStatuses = gets roomStatuses

