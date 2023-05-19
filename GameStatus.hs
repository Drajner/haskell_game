module GameStatus where

import CurrentPosition
import Flag


data GameStatus = GameStatus
    { currentPosition :: CurrentPosition
    , flags :: [Flag]

    }