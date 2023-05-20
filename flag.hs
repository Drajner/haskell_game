module Flag where

import Control.Monad.State
import Data.List
import Data.Maybe

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

getFlagValue :: Flag -> Bool
getFlagValue = isSet

getFlagName :: Flag -> String
getFlagName = name

findFlagByName :: String -> [Flag] -> Maybe Flag
findFlagByName flagName = find (\flag -> name flag == flagName)

isFlagSet :: String -> [Flag] -> Bool
isFlagSet flagName flags = isJust (findFlagByName flagName flags)

setFlagByName :: String -> [Flag] -> [Flag]
setFlagByName flagName = map updateFlag
  where
    updateFlag flag
      | name flag == flagName = flag { isSet = True }
      | otherwise = flag