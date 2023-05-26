module Pickup where
import GameStatus
import RoomStatus

{-polishCompensationItem :: [String] -> String
polishCompensationItem cmdWords = do
    let lastWord = last cmdWords
    let secondLastWord = last (init cmdWords)
    case lastWord of
        "skafander" -> "skafander"
        "janusza"   -> "klucz_do_szafki_janusza"
        "przyneta"  -> "przyneta"
        "przynęta"  -> 
        "wedka"     ->
        "wedke"     ->
        "haczyka"   ->
        "wedke_bez_haczyka" ->
        "wedka_bez_haczyka" ->
        "drabine"   ->
        "drabina"   ->
        "haczyk"    -> 
        "szalik"    ->
        "ksiazke"   ->
        "książkę"   ->
        "ksiażkę"   ->
        "ksiazkę"   ->
        "książke"   ->
        "ksiązkę"   ->
        "ksiązke"   ->
        "ksiażke"   ->
        "kręgli"    ->
        "kregli"    ->
        "kula"      ->
        "francuski" ->
        "klucz"     ->
        "ryba"      ->
        "rybę"      ->
        "mlotek"    ->
        "młotek"    ->
        "szaliku"   ->
        "srubokret" ->
        "śrubokret" ->
        "śrubokręt" ->
        "srubokręt" ->
        _           ->
-}
pickupItem :: GameStatus -> String -> (String, GameStatus)
pickupItem status itemToTake = do
    let currentRoomStatus = findRoomStatus (getPosition status) (getRoomStatuses status)
    case currentRoomStatus of
        Just roomStat   -> do
                        if itemToTake `elem` getInventory status
                            then ("Kapitan trzyma juz ten przedmiot w ekwipunku.", status)
                            else if itemToTake `elem` roomInventory roomStat
                                    then do
                                            let newPartialStatus = addToInventory status itemToTake
                                            let newRoomStatus = removeFromRoom roomStat itemToTake
                                            let newRoomStatuses = switchRoomStatus (getRoomStatuses status) newRoomStatus
                                            let newStatus = newPartialStatus {roomStatuses = newRoomStatuses}
                                            (("Bomba podnosi " ++ itemToTake), newStatus)
                                    else ("Nie ma tu takiego przedmiotu.", status)
        Nothing         -> ("Ten pokoj nie istnieje.", status)
        