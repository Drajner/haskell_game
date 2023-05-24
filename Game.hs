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

        "otworz"    -> do
                    if getPosition status == "sluza"
                        then if isFlagSet "sluzaOtwarta" (getFlags status)
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

                        else do
                            putStrLn "Nie ma tu czego otwierać!"
                            gameLoop status
        "otwórz"    ->do
                    if getPosition status == "sluza"
                        then if isFlagSet "sluzaOtwarta" (getFlags status)
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

                        else do
                            putStrLn "Nie ma tu czego otwierać!"
                            gameLoop status
        "zamknij"   -> do
                    if getPosition status == "sluza"
                        then if isFlagSet "sluzaOtwarta" (getFlags status)
                                then do
                                    let newStatus = resetFlagInStatus status "sluzaOtwarta"
                                    putStrLn "Sluza skrzypiac niemilosiernie, wypelnia sie woda. Po paru chwilach wypelnia sie calkowicie i otwiera wyjscie."
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
        "chuj"  -> do --debug command
                    putStrLn (getPosition status)
                    gameLoop status
        "dupa" -> do
                    print (isFlagSet "sluzaOtwarta" (getFlags status))
                    print (isFlagSet "skafanderZalozony" (getFlags status))
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

