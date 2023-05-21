-- PODWODNA PRZYGODA KAPITANA BOMBY
-- Aleksandra Majewska, Daniel Kobiałka, Bartłomiej Dudek 2023

import GameStatus
import Descriptions
import Flag
import RoomStatus


-- print strings from list in separate lines
printLines :: [String] -> IO ()
printLines xs = putStr (unlines xs)
                  
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
    let lastWord = lastWord
    case cmd of
        "ekwipunek" -> do
                    putStrLn "Kapitan Bomba trzyma obecnie:"
                    printInventory status
                    gameLoop status
        "instrukcja" -> do
                        printInstructions
                        gameLoop status
        "koniec" -> return ()
        _ -> do printLines ["Nieznana komenda", ""]
                gameLoop status

main = do
    let startingPosition = "pokoj"
    let startingFlags =
            [ startFlag "skafanderZalozony"
            , startFlag "skafanderZbadany"
            , startFlag "klodkaZamknieta"
            , startFlag "szafkaJanuszaOtwarta"
            , startFlag "kluczJanuszaWydany"
            , startFlag "chudaRybaZlapana"
            , startFlag "grubaRybaZlapana"
            , startFlag "szklaneDrzwiczkiOtwarte"
            , startFlag "dolneDrzwiczkiOtwarte"
            , startFlag "farbaZdrapana"
            , startFlag "skrzynkaNaNarzedziaOtwarta"
            , startFlag "drabinaPozaSzafa"
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
    gameLoop startingStatus

