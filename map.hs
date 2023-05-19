import Control.Monad.State
import Control.Monad.IO.Class

data CurrentPosition = CurrentPosition
 { position :: String
 }


-- bedzie trzeba zrobic refactor jak sie ogarnie sluze
changePosition :: String -> State CurrentPosition ()
changePosition newPosition = modify (\s -> s {position = newPosition})
    

decidePositionModification :: String -> String -> Int
decidePositionModification  currentPos newPos = do
    let places = ["pokoj","dziob","przod_ogona","tyl_ogona","sluza","skrzydlo_prawe","skrzydlo_lewe"]
    if elem newPos places
        then if newPos /= currentPos
            then 1
            else 2
        else 3

givePositionModificationText :: Int -> String -> String
givePositionModificationText 1 pos = ("Kapitan udal sie do " ++ pos)
givePositionModificationText 2 pos = "Kapitan Bomba wlasnie tam jest"
givePositionModificationText 3 pos = "Niestety nie da sie tam pojsc."




getPosition :: State CurrentPosition String
getPosition = gets position

mapLoop :: CurrentPosition -> IO ()
mapLoop pos = do

    let mes = evalState getPosition pos
    putStrLn ("START" ++ mes)
    input <- getLine
    let decision = decidePositionModification mes input
    putStrLn(givePositionModificationText decision input)
    print decision
    case decision of
        1 -> do
                let ((), finalState) = runState (changePosition input) pos
                let mes2 = evalState getPosition finalState
                putStrLn ("END" ++ mes2)
                mapLoop finalState
        2 -> do
                putStrLn ("END" ++ mes)
                mapLoop pos
        3 -> do
                putStrLn ("END" ++ mes)
                mapLoop pos


main :: IO ()
main = do 
    let pos = CurrentPosition {position = "pokoj"}
    mapLoop pos



