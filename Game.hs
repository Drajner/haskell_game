-- PODWODNA PRZYGODA KAPITANA BOMBY
-- Aleksandra Majewska, Daniel Kobiałka, Bartłomiej Dudek 2023

import GameStatus
import Descriptions
import Flag
import RoomStatus
import Map (moveCommand)
import Reading
import Description
import Pickup
import Items
import Look
import Ask (askAbout)

                  
printIntroduction = printLines introductionText
printInstructions = printLines instructionsText

readCommand :: IO String
readCommand = do
    putStr "> "
    xs <- getLine
    return xs
    
-- note that the game loop may take the game state as
-- an argument, eg. gameLoop :: State -> IO ()
gameLoop :: GameStatus -> IO ()
gameLoop status = do
    cmd <- readCommand
    let cmdWords = words cmd
    let firstWord = head cmdWords
    let secondWord = head (tail cmdWords)
    let secondLastWord = last (init cmdWords)
    let lastWord = last cmdWords
    case firstWord of
        "idz"       -> do
                    if length cmdWords < 2
                        then
                            putStrLn "Ta komenda wymaga pomieszczenia. Np.: 'idz do pokoju' "
                        else do
                            let (succesfulMove, returningMessage, newStatus) = moveCommand status cmdWords
                            putStrLn returningMessage
                            if succesfulMove
                                then do
                                    describe newStatus
                                    gameLoop newStatus
                                else gameLoop newStatus

        "idź"       -> do
                    if length cmdWords < 2
                        then
                            putStrLn "Ta komenda wymaga pomieszczenia. Np.: 'idz do pokoju' "
                        else do
                            let (succesfulMove, returningMessage, newStatus) = moveCommand status cmdWords
                            putStrLn returningMessage
                            if succesfulMove
                                then do
                                    describe newStatus
                                    gameLoop newStatus
                                else gameLoop newStatus


        "opis"      -> do
                        describe status
                        gameLoop status


        "podnies"   -> do  -- i will be back to it
                    let (returningMessage, newStatus) = pickupItem status lastWord
                    putStrLn returningMessage
                    gameLoop newStatus

        "uzyj"      -> do  -- i will be back to it
                    let (returningMessage, newStatus) = useItem status lastWord
                    printLines returningMessage
                    gameLoop newStatus

        "zobacz"    -> do -- i will be back to it
                    let (returningMessage, newStatus) = lookAt status lastWord
                    printLines returningMessage
                    gameLoop newStatus

        "zapytaj"   -> do
                    let (returningMessage, newStatus) = askAbout status secondWord lastWord
                    printLines returningMessage
                    gameLoop newStatus

        "otworz"    -> do -- need to do lockers
                    case getPosition status of
                        "sluza" -> if isFlagSet "sluzaOtwarta" (getFlags status)
                                    then do
                                        putStrLn "Nie ma potrzeby otwierac dobrze otwartej sluzy"
                                        gameLoop status
                                    else if isFlagSet "skafanderZalozony" (getFlags status)
                                            then do
                                                let newStatus = setFlagInStatus status "sluzaOtwarta"
                                                putStrLn "Sluza skrzypiac niemilosiernie, wypelnia sie woda. Po paru chwilach wypelnia sie calkowicie i otwiera wyjscie."
                                                gameLoop newStatus
                                            else do 
                                                printLines sluzaDeathText
                                                return()

                        "pokoj" -> if secondLastWord == "szafkę" || secondLastWord == "szafke" 
                                    then case lastWord of
                                            "janusza"   -> if isFlagSet "szafkaJanuszOtwarta" (getFlags status)
                                                            then do
                                                                printLines openJanuszLockerAgainText
                                                                gameLoop status
                                                            else if "klucz_do_szafki_janusza" `elem` getInventory status
                                                                    then do
                                                                        printLines openJanuszLockerText
                                                                        let newStatus = addItemToGameByRoom (addItemToGameByRoom status "wedka_bez_haczyka" "pokoj") "czerwona_przyneta" "pokoj"
                                                                        let newStatus1 = addItemToGameByRoom (addItemToGameByRoom newStatus "zielona_przyneta" "pokoj") "niebieska_przyneta" "pokoj"
                                                                        let newStatus2 = setFlagInStatus (removeFromInventory newStatus1 "klucz_do_szafki_janusza") "szafkaJanuszaOtwarta"
                                                                        gameLoop newStatus2
                                                                    else do
                                                                        printLines openJanuszLockerFailText
                                                                        gameLoop status

                                            
                                            "Janusza"   -> if isFlagSet "szafkaJanuszOtwarta" (getFlags status)
                                                            then do
                                                                printLines openJanuszLockerAgainText
                                                                gameLoop status
                                                            else if "klucz_do_szafki_janusza" `elem` getInventory status
                                                                    then do
                                                                        printLines openJanuszLockerText
                                                                        let newStatus = addItemToGameByRoom (addItemToGameByRoom status "wedka_bez_haczyka" "pokoj") "czerwona_przyneta" "pokoj"
                                                                        let newStatus1 = addItemToGameByRoom (addItemToGameByRoom newStatus "zielona_przyneta" "pokoj") "niebieska_przyneta" "pokoj"
                                                                        let newStatus2 = setFlagInStatus (removeFromInventory newStatus1 "klucz_do_szafki_janusza") "szafkaJanuszaOtwarta"
                                                                        gameLoop newStatus2
                                                                    else do
                                                                        printLines openJanuszLockerFailText
                                                                        gameLoop status

                                            "Seby"      -> do
                                                            printLines openSebaLockerText
                                                            gameLoop status
                                            "seby"      -> do
                                                            printLines openSebaLockerText
                                                            gameLoop status
                                    else do
                                        putStrLn "Czyja szafke?"
                                        gameLoop status

                        _ -> do
                            putStrLn "Nie ma tu czego otwierac!"
                            gameLoop status
        "otwórz"    ->do -- need to do lockers
                    case getPosition status of
                        "sluza" -> if isFlagSet "sluzaOtwarta" (getFlags status)
                                    then do
                                        putStrLn "Nie ma potrzeby otwierac dobrze otwartej sluzy"
                                        gameLoop status
                                    else if isFlagSet "skafanderZalozony" (getFlags status)
                                            then do
                                                let newStatus = setFlagInStatus status "sluzaOtwarta"
                                                putStrLn "Sluza skrzypiac niemilosiernie, wypelnia sie woda. Po paru chwilach wypelnia sie calkowicie i otwiera wyjscie."
                                                gameLoop newStatus
                                            else do 
                                                printLines sluzaDeathText
                                                return()

                        "pokoj" -> if secondLastWord == "szafkę" || secondLastWord == "szafke" 
                                    then case lastWord of
                                            "janusza"   -> if isFlagSet "szafkaJanuszOtwarta" (getFlags status)
                                                            then do
                                                                printLines openJanuszLockerAgainText
                                                                gameLoop status
                                                            else if "klucz_do_szafki_janusza" `elem` getInventory status
                                                                    then do
                                                                        printLines openJanuszLockerText
                                                                        let newStatus = addItemToGameByRoom (addItemToGameByRoom status "wedka_bez_haczyka" "pokoj") "czerwona_przyneta" "pokoj"
                                                                        let newStatus1 = addItemToGameByRoom (addItemToGameByRoom newStatus "zielona_przyneta" "pokoj") "niebieska_przyneta" "pokoj"
                                                                        let newStatus2 = setFlagInStatus (removeFromInventory newStatus1 "klucz_do_szafki_janusza") "szafkaJanuszaOtwarta"
                                                                        gameLoop newStatus2
                                                                    else do
                                                                        printLines openJanuszLockerFailText
                                                                        gameLoop status

                                            
                                            "Janusza"   -> if isFlagSet "szafkaJanuszOtwarta" (getFlags status)
                                                            then do
                                                                printLines openJanuszLockerAgainText
                                                                gameLoop status
                                                            else if "klucz_do_szafki_janusza" `elem` getInventory status
                                                                    then do
                                                                        printLines openJanuszLockerText
                                                                        let newStatus = addItemToGameByRoom (addItemToGameByRoom status "wedka_bez_haczyka" "pokoj") "czerwona_przyneta" "pokoj"
                                                                        let newStatus1 = addItemToGameByRoom (addItemToGameByRoom newStatus "zielona_przyneta" "pokoj") "niebieska_przyneta" "pokoj"
                                                                        let newStatus2 = setFlagInStatus (removeFromInventory newStatus1 "klucz_do_szafki_janusza") "szafkaJanuszaOtwarta"
                                                                        gameLoop newStatus2
                                                                    else do
                                                                        printLines openJanuszLockerFailText
                                                                        gameLoop status

                                            "Seby"      -> do
                                                            printLines openSebaLockerText
                                                            gameLoop status
                                            "seby"      -> do
                                                            printLines openSebaLockerText
                                                            gameLoop status
                                    else do
                                        putStrLn "Czyja szafke?"
                                        gameLoop status

                        _ -> do
                            putStrLn "Nie ma tu czego otwierac!"
                            gameLoop status
        "zamknij"   -> do
                    if getPosition status == "sluza"
                        then if isFlagSet "sluzaOtwarta" (getFlags status)
                                then do
                                    let newStatus = resetFlagInStatus status "sluzaOtwarta"
                                    putStrLn "Maszyneria z duzym trudem wymienia wode na powietrze. Po sporym oczekiwaniu wrota na statek otwieraja sie."
                                    gameLoop newStatus
                                else do
                                    putStrLn "Ta sluza bardziej sie juz nie zamknie."
                                    gameLoop status
                        else do
                            putStrLn "Nie ma tu czego zamykac!"
                            gameLoop status
        
        "ekwipunek" -> do
                    putStrLn "Kapitan Bomba trzyma obecnie:"
                    printInventory status
                    gameLoop status

        "instrukcja" -> do
                        printInstructions
                        gameLoop status

        "napraw" -> do 
                    if getPosition status == "dziob"
                        then do
                            if "srubokret" `elem` getInventory status && "mlotek" `elem` getInventory status && "klucz_francuski" `elem` getInventory status
                                then do
                                    printLines finaleText
                                    return ()
                                else do
                                    printLines repairFailToolsText
                                    gameLoop status
                        else do
                            printLines repairFailPlaceText
                            gameLoop status

        "wpisz" ->  do
                    case getPosition status of
                        "pokoj" -> do
                            if isFlagSet "skafanderZbadany" (getFlags status) && not (isFlagSet "klodkaOtwarta" (getFlags status))
                                then case lastWord of
                                        "2137" -> do
                                                printLines suitCodeSuccessText
                                                let newStatus = addItemToGameByRoom status "skafander" "pokoj"
                                                gameLoop (setFlagInStatus newStatus "klodkaOtwarta")
                                        _ ->    do
                                                printLines suitCodeFailText
                                                gameLoop status
                                else do
                                    printLines suitCodeUnknownText
                                    gameLoop status
                        
                        "przod_ogona" -> do
                            if not (isFlagSet "dolneDrzwiczkiOtwarte" (getFlags status))
                                then case lastWord of
                                    "kapibara" -> do
                                                printLines lookLowerDoorJustOpenText
                                                let newStatus = addItemToGameByRoom status "kula_do_kregli" "przod_ogona"
                                                gameLoop (setFlagInStatus newStatus "dolneDrzwiczkiOtwarte")
                                    _ ->  do
                                        printLines lookLowerDoorOpenFailText
                                        gameLoop status
                                else do
                                    printLines suitCodeUnknownText
                                    gameLoop status
                        
                        "tyl_ogona" -> do
                            if not (isFlagSet "skrzynkaNaNarzedziaOtwarta" (getFlags status))
                                then case lastWord of
                                    "<>^^>" -> do
                                                printLines openToolboxText
                                                let newStatus = addItemToGameByRoom status "klucz_francuski" "tyl_ogona"
                                                gameLoop (setFlagInStatus newStatus "skrzynkaNaNarzedziaOtwarta")
                                    _ ->  do
                                        printLines lookLowerDoorOpenFailText
                                        gameLoop status
                                else do
                                    printLines suitCodeUnknownText
                                    gameLoop status

                        _ -> do
                            putStrLn "Nie ma tu nic do wpisania!"
                            gameLoop status

        "chuj"  -> do --debug command
                    putStrLn (getPosition status)
                    gameLoop status
        "dupa" -> do
                    print (isFlagSet "sluzaOtwarta" (getFlags status))
                    print (isFlagSet "skafanderZalozony" (getFlags status))
                    print (isFlagSet "klodkaOtwarta" (getFlags status))
                    print (isFlagSet "szafkaJanuszaOtwarta" (getFlags status))
                    print (isFlagSet "kluczJanuszaWydany" (getFlags status))
                    print (isFlagSet "chudaRybaZlapana" (getFlags status))
                    print (isFlagSet "grubaRybaZlapana" (getFlags status))
                    print (isFlagSet "szklaneDrzwiczkiOtwarte" (getFlags status))
                    print (isFlagSet "dolneDrzwiczkiOtwarte" (getFlags status))
                    print (isFlagSet "farbaZdrapana" (getFlags status))
                    print (isFlagSet "skrzynkaNaNarzedziaOtwarta" (getFlags status))
                    print (isFlagSet "drabinaPozaSzafa" (getFlags status))
                    print (isFlagSet "januszGotuje" (getFlags status))
                    gameLoop status

        "koniec" -> return ()
        _ -> do printLines ["Nieznana komenda", ""]
                gameLoop status

main = do
    let startingPosition = "pokoj"
    let startingFlags =
            [ startFlag "skafanderZalozony"
            , startFlag "skafanderZbadany"
            , startFlag "klodkaOtwarta"
            , startFlag "szafkaJanuszaOtwarta"
            , startFlag "kluczJanuszaWydany"
            , startFlag "chudaRybaZlapana"
            , startFlag "grubaRybaZlapana"
            , startFlag "szklaneDrzwiczkiOtwarte"
            , startFlag "dolneDrzwiczkiOtwarte"
            , startFlag "farbaZdrapana"
            , startFlag "skrzynkaNaNarzedziaOtwarta"
            , startFlag "drabinaPozaSzafa"
            , startFlag "sluzaOtwarta"
            , startFlag "januszGotuje"
            ]
    let startingInventory = []
    let startingRoomStatuses = 
            [ RoomStatus "dziob" []
            , RoomStatus "pokoj" []
            , RoomStatus "przod_ogona" ["haczyk", "ksiazka"]
            , RoomStatus "tyl_ogona" ["szalik"]
            , RoomStatus "sluza" []
            , RoomStatus "skrzydlo_lewe" []
            , RoomStatus "skrzydlo_prawe" []
            ]
    let startingStatus = GameStatus startingPosition startingFlags startingInventory startingRoomStatuses
    printIntroduction
    printInstructions
    describe startingStatus
    gameLoop startingStatus

