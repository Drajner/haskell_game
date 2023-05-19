module CurrentPosition where

import Control.Monad.State

data CurrentPosition = CurrentPosition
 { position :: String
 }

changePosition :: String -> State CurrentPosition ()
changePosition newPosition = modify (\s -> s {position = newPosition})

getPosition :: State CurrentPosition String
getPosition = gets position