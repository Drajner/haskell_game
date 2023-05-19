module Flags where

import Control.Monad.State

data Flag = Flag
 { name :: String,
   isSet :: Bool
 }

startFlag :: String -> Flag
startFlag flagName = Flag { name = flagName, isSet = False }

setFlag :: State Flag ()
setFlag = modify(\s -> s {isSet = True})

resetFlag :: State Flag ()
resetFlag = modify(\s -> s {isSet = False})

