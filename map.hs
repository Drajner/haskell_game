module Map where

import Control.Monad.State
import Flag
import CurrentPosition


decidePositionModification :: String -> String -> Flag -> Int
decidePositionModification  currentPos newPos airlockOpen = do
    let shipPlaces = ["pokoj","dziob","przod_ogona","tyl_ogona","sluza"]
    let outsidePlaces = ["sluza","skrzydlo_prawe","skrzydlo_lewe"]
    let airlockState = getFlagValue airlockOpen
    if airlockState
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


