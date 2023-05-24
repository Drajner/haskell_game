module Description where
import GameStatus
import Reading
import Descriptions
import RoomStatus
import Flag

describe :: GameStatus -> IO ()
describe status = do
    case getPosition status of
        "dziob"             -> do
                                printLines dziobText
                                itemPlacingDescription (findRoomStatus "dziob" (getRoomStatuses status))
        
        "pokoj"             -> do
                            if isFlagSet "januszGotuje" (getFlags status)
                             then do
                                printLines pokojCookingText
                                itemPlacingDescription (findRoomStatus "pokoj" (getRoomStatuses status))
                             else if isFlagSet "klodkaOtwarta" (getFlags status)
                                    then do
                                        printLines pokojSecondText
                                        itemPlacingDescription (findRoomStatus "pokoj" (getRoomStatuses status))
                                    else do
                                        printLines pokojInitialText
                                        itemPlacingDescription (findRoomStatus "pokoj" (getRoomStatuses status))
                                

        "tyl_ogona"         -> do
                                if isFlagSet "skrzyniaNaNarzedziaOtwarta" (getFlags status)
                                    then do
                                        printLines tylOgonaThirdText
                                        itemPlacingDescription (findRoomStatus "tyl_ogona" (getRoomStatuses status))
                                    else do
                                        printLines tylOgonaFirstText
                                        itemPlacingDescription (findRoomStatus "tyl_ogona" (getRoomStatuses status))

        
        "przod_ogona"       -> do
                                printLines przodOgonaText
                                itemPlacingDescription (findRoomStatus "przod_ogona" (getRoomStatuses status))
        
        "sluza"             -> do
                                printLines sluzaText
                                itemPlacingDescription (findRoomStatus "sluza" (getRoomStatuses status))

        "skrzydlo_lewe"     -> do
                                printLines skrzydloLeweText
                                itemPlacingDescription (findRoomStatus "skrzydlo_lewe" (getRoomStatuses status))

        "skrzydlo_prawe"    -> do
                                printLines skrzydloPraweText
                                itemPlacingDescription (findRoomStatus "skrzydlo_prawe" (getRoomStatuses status))

        _ -> putStrLn "To miejsce nie istnieje"


itemPlacingDescription :: Maybe RoomStatus -> IO ()
itemPlacingDescription maybeRoomStat = case maybeRoomStat of
    Just rS -> do
            if null (roomInventory rS)
                then putStrLn "Nie ma tu przedmiotow do podniesienia."
                else do
                    putStrLn "Znajduja sie tu:"
                    printRoomStatus rS
    Nothing -> putStrLn "Nie ma tu zadnych przedmiotow."
    