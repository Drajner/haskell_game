import Control.Monad.State

data CurrentPosition = CurrentPosition
 { position :: String
 }

changePosition :: String -> State CurrentPosition ()
changePosition newPosition = modify (\s -> s {position = newPosition})

getPosition :: State CurrentPosition String
getPosition = gets position

mapLoop :: CurrentPosition -> IO ()
mapLoop pos = do

    let mes = evalState getPosition pos
    putStrLn ("START" ++ mes)
    input <- getLine
    let ((), finalState) = runState (changePosition input) pos
    let mes2 = evalState getPosition finalState
    putStrLn ("END" ++ mes2)
    mapLoop finalState


main :: IO ()
main = do 
    let pos = CurrentPosition {position = "pokoj"}
    mapLoop pos



