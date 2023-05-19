module GameStatus where

import CurrentPosition
import Flag
import Control.Monad.State

data GameStatus = GameStatus
    { currentPosition :: CurrentPosition
    , flags :: [Flag]
    }

getFlags :: State GameStatus [Flag]
getFlags = gets flags

getCurrentPosition :: State GameStatus CurrentPosition
getCurrentPosition = gets currentPosition