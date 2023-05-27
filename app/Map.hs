module Map where

import Flag
import GameStatus (GameStatus, getPosition, getFlags, setPosition)


decidePositionModification :: String -> String -> Bool -> Int
decidePositionModification  currentPos newPos airlockOpen = do
    let shipPlaces = ["pokoj","dziob","przod_ogona","tyl_ogona","sluza"]
    let outsidePlaces = ["sluza","skrzydlo_prawe","skrzydlo_lewe"]
    if airlockOpen
        then if elem newPos outsidePlaces
                then if newPos /= currentPos
                        then 1
                        else 2
                else 3
        else if elem newPos shipPlaces
                then if newPos /= currentPos
                        then 1
                        else 2
                else 3
    

givePositionModificationText :: Int -> String -> String
givePositionModificationText 1 pos = ("Kapitan udal sie do " ++ pos)
givePositionModificationText 2 pos = "Kapitan Bomba wlasnie tam jest"
givePositionModificationText 3 pos = "Niestety nie da sie tam pojsc."

polishCompensationMap :: [String] -> String
polishCompensationMap cmdWords = do
        let lastWord = last cmdWords
        let notLastWord = last (init cmdWords)
        case lastWord of
                "pokoj" -> "pokoj"
                "pokoju" -> "pokoj"
                "pokój" -> "pokoj"
                "dziob" -> "dziob"
                "dziób" -> "dziob"
                "dziobu" -> "dziob"
                "ogona" -> do
                        case notLastWord of
                                "tył" -> "tyl_ogona"
                                "przód" -> "przod_ogona"
                                "tyl" -> "tyl_ogona"
                                "przod" -> "przod_ogona"
                                _ -> "nic"
                "tyl_ogona" -> "tyl_ogona"
                "przod_ogona" -> "przod_ogona"
                "tył_ogona" -> "tyl_ogona"
                "przód_ogona" -> "przod_ogona"
                "sluza" -> "sluza"
                "sluzy" -> "sluza"
                "śluzy" -> "sluza"
                "śluza" -> "sluza"
                "prawe" -> "skrzydlo_prawe"
                "skrzydlo_prawe" -> "skrzydlo_prawe"
                "skrzydło_prawe" -> "skrzydlo_prawe"
                "skrzydlo" -> do
                        case notLastWord of
                                "lewe" -> "skrzydlo_lewe"
                                "prawe" -> "skrzydlo_prawe"
                                _ -> "nic"
                "lewe" -> "skrzydlo_lewe"
                "skrzydlo_lewe" -> "skrzydlo_lewe"
                "skrzydło_lewe" -> "skrzydlo_lewe"
                _ -> "nic"


moveCommand :: GameStatus -> [String] -> (Bool, String, GameStatus)
moveCommand status cmdWords = do
        let destination = polishCompensationMap cmdWords
        let airlockOpen = isFlagSet "sluzaOtwarta" (getFlags status)
        let decision = decidePositionModification (getPosition status) destination airlockOpen
        let returningMessage = givePositionModificationText decision destination
        case decision of
                1 -> do
                        let newStatus = setPosition status destination
                        (True, returningMessage, newStatus)

                2 -> (False, returningMessage, status)

                3 -> (False, returningMessage, status)


        



{-
mapLoop :: (CurrentPosition, Flag) -> IO ()
mapLoop (pos, airlockFlag) = do

    let mes = evalState getPosition pos
    putStrLn ("START" ++ mes)
    input <- getLine
    let decision = decidePositionModification mes input airlockFlag
    putStrLn(givePositionModificationText decision input)
    print decision
    case decision of
        1 -> do
                let ((), finalState) = runState (changePosition input) pos
                let mes2 = evalState getPosition finalState
                putStrLn ("END" ++ mes2)
                mapLoop (finalState, airlockFlag)
        2 -> do
                putStrLn ("END" ++ mes)
                mapLoop (pos, airlockFlag)
        3 -> do
                putStrLn ("END" ++ mes)
                mapLoop (pos, airlockFlag)


main :: IO ()
main = do 
    let pos = CurrentPosition {position = "pokoj"}
    let airlockFlag = startFlag "sluzaOtwarta"
    mapLoop (pos, airlockFlag)
-}


