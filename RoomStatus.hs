module RoomStatus where

import Data.List

data RoomStatus = RoomStatus
    { roomName :: String 
    , inventory ::[String]
    }

removeFromRoom :: RoomStatus -> String -> RoomStatus
removeFromRoom status itemToGo = status {inventory = filter (/=itemToGo) (inventory status)}

addToRoom :: RoomStatus -> String -> RoomStatus
addToRoom status newItem = status {inventory = newItem : inventory status}

printRoomStatus :: RoomStatus -> IO ()
printRoomStatus status = mapM_ putStrLn (inventory status)

findRoomStatus :: String -> [RoomStatus] -> Maybe RoomStatus
findRoomStatus targetName = find (\status -> roomName status == targetName)

switchRoomStatus ::  [RoomStatus] -> RoomStatus -> [RoomStatus]
switchRoomStatus statuses newStatus = map updateStatus statuses
  where
    updateStatus status
      | roomName status == roomName newStatus = newStatus
      | otherwise = status

{-}
main = do
    let rs = ["jeden","dwa"]
    printRoomStatus rs
    let ((),newRs) = runState (removeFromRoom "dwa") rs
    printRoomStatus newRs
-}
