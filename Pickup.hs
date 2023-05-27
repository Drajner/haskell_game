module Pickup where
import GameStatus
import RoomStatus

polishCompensationItem :: [String] -> String
polishCompensationItem cmdWords = do
    let lastWord = last cmdWords
    let secondLastWord = last (init cmdWords)
    case lastWord of
        "skafander" -> "skafander"
        "skafandra" -> "skafander"
        "janusza"   -> if "klucz" `elem` cmdWords || "klucza" `elem` cmdWords
                            then "klucz_do_szafki_janusza"
                            else lastWord
        "Janusza"   -> if "klucz" `elem` cmdWords || "klucza" `elem` cmdWords
                            then "klucz_do_szafki_janusza"
                            else lastWord
        "przyneta"  ->  if "wedka" `elem` cmdWords || "wędka" `elem` cmdWords || "wedki" `elem` cmdWords || "wędki" `elem` cmdWords
                        then if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "wedka_z_niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "wedka_z_zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "wedka_z_czerwona_przyneta"
                                                else lastWord
                        else if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "czerwona_przyneta"
                                                else lastWord
        "przynęta"  -> if "wedka" `elem` cmdWords || "wędka" `elem` cmdWords || "wedki" `elem` cmdWords || "wędki" `elem` cmdWords
                        then if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "wedka_z_niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "wedka_z_zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "wedka_z_czerwona_przyneta"
                                                else lastWord
                        else if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "czerwona_przyneta"
                                                else lastWord
        "przynete"  -> if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                        then "niebieska_przyneta"
                        else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                then "zielona_przyneta"
                                else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                        then "czerwona_przyneta"
                                        else lastWord
        "przynęte"  -> if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                        then "niebieska_przyneta"
                        else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                then "zielona_przyneta"
                                else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                        then "czerwona_przyneta"
                                        else lastWord
        "przynętę"  -> if "wedka" `elem` cmdWords || "wędka" `elem` cmdWords || "wedki" `elem` cmdWords || "wędki" `elem` cmdWords
                        then if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "wedka_z_niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "wedka_z_zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "wedka_z_czerwona_przyneta"
                                                else lastWord
                        else if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "czerwona_przyneta"
                                                else lastWord
        "przynetą"  -> if "wedka" `elem` cmdWords || "wędka" `elem` cmdWords || "wedki" `elem` cmdWords || "wędki" `elem` cmdWords
                        then if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "wedka_z_niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "wedka_z_zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "wedka_z_czerwona_przyneta"
                                                else lastWord
                        else if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "czerwona_przyneta"
                                                else lastWord
        "przynętą"  -> if "wedka" `elem` cmdWords || "wędka" `elem` cmdWords || "wedki" `elem` cmdWords || "wędki" `elem` cmdWords
                        then if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "wedka_z_niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "wedka_z_zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "wedka_z_czerwona_przyneta"
                                                else lastWord
                        else if "niebieska" `elem` cmdWords || "niebieską" `elem` cmdWords
                                then "niebieska_przyneta"
                                else if "zielona" `elem` cmdWords || "zieloną" `elem` cmdWords
                                        then "zielona_przyneta"
                                        else if "czerwona" `elem` cmdWords || "czerwoną" `elem` cmdWords
                                                then "czerwona_przyneta"
                                                else lastWord
        "wedka"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "wedke"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "wedkę"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "wędkę"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "wędke"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "wedki"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "wędki"     ->  if "haczyka" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "wedka"
        "haczyka"   -> if ("wedka" `elem` cmdWords || "wędka" `elem` cmdWords || "wędke" `elem` cmdWords || "wędkę" `elem` cmdWords) && "bez" `elem` cmdWords
                            then "wedka_bez_haczyka"
                            else "haczyk"
        "wedke_bez_haczyka" -> "wedka_bez_haczyka"
        "wedkę_bez_haczyka" -> "wedka_bez_haczyka"
        "wędkę_bez_haczyka" -> "wedka_bez_haczyka"
        "wędke_bez_haczyka" -> "wedka_bez_haczyka"
        "drabine"   -> "drabine"
        "drabina"   -> "drabina"
        "haczyk"    -> "haczyk"
        "szalik"    -> "szalik"
        "ksiazke"   -> "ksiazke"
        "książkę"   -> "ksiazke"
        "ksiażkę"   -> "ksiazke"
        "ksiazkę"   -> "ksiazke"
        "książke"   -> "ksiazke"
        "ksiązkę"   -> "ksiazke"
        "ksiązke"   -> "ksiazke"
        "ksiażke"   -> "ksiazke"
        "kręgli"    -> if "kula" `elem` cmdWords || "kule" `elem` cmdWords || "kulę" `elem` cmdWords || "kuli" `elem` cmdWords
                        then "kula_do_kregli"
                        else lastWord
        "kregli"    -> if "kula" `elem` cmdWords || "kule" `elem` cmdWords || "kulę" `elem` cmdWords || "kuli" `elem` cmdWords
                        then "kula_do_kregli"
                        else lastWord
        "kule_do_kregli" -> "kula_do_kregli"
        "kulę_do_kręgli" -> "kula_do_kregli"
        "kule_do_kręgli" -> "kula_do_kregli"
        "kulę_do_kregli" -> "kula_do_kregli"
        "kula"      -> "kula_do_kregli"
        "kule"      ->  "kula_do_kregli"
        "kulę"       -> "kula_do_kregli"
        "francuski" -> if "klucz" `elem` cmdWords
                            then "klucz_francuski"
                            else lastWord
        "klucz"     ->  if "janusza" `elem` cmdWords || "Janusza" `elem` cmdWords
                            then "klucz_do_szafki_janusza"
                            else "klucz_francuski"
        "ryba"      -> if "chuda" `elem` cmdWords || "chudą"  `elem` cmdWords
                            then "chuda_ryba"
                            else if "gruba" `elem` cmdWords || "grubą"  `elem` cmdWords
                                then "gruba_ryba"
                                else lastWord
        "rybe"      -> if "chuda" `elem` cmdWords || "chudą"  `elem` cmdWords
                            then "chuda_ryba"
                            else if "gruba" `elem` cmdWords || "grubą"  `elem` cmdWords
                                then "gruba_ryba"
                                else lastWord
        "rybę"      -> if "chuda" `elem` cmdWords || "chudą"  `elem` cmdWords
                            then "chuda_ryba"
                            else if "gruba" `elem` cmdWords || "grubą"  `elem` cmdWords
                                then "gruba_ryba"
                                else lastWord
        "mlotek"    -> "mlotek"
        "młotek"    -> "mlotek"
        "mlotka"    -> "mlotek"
        "młotka"    -> "mlotek"
        "szaliku"   -> if "kula" `elem` cmdWords || "kule" `elem` cmdWords || "kulę" `elem` cmdWords || "kuli" `elem` cmdWords
                        then "kula_w_szliku"
                        else lastWord
        "kuli_w_szaliku" -> "kula_w_szaliku"
        "srubokret" -> "srubokret"
        "śrubokret" -> "srubokret"
        "śrubokręt" -> "srubokret"
        "srubokręt" -> "srubokret"
        "srubokretu" -> "srubokret"
        "śrubokretu" -> "srubokret"
        "śrubokrętu" -> "srubokret"
        "srubokrętu" -> "srubokret"
        "srubokreta" -> "srubokret"
        "śrubokreta" -> "srubokret"
        "śrubokręta" -> "srubokret"
        "srubokręta" -> "srubokret"
        _           -> lastWord

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
        