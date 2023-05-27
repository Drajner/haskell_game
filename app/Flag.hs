module Flag where

import Data.List
import Data.Maybe

data Flag = Flag
 { name :: String,
   isSet :: Bool
 }

startFlag :: String -> Flag
startFlag flagName = Flag { name = flagName, isSet = False }

getFlagValue :: Flag -> Bool
getFlagValue = isSet

getFlagName :: Flag -> String
getFlagName = name

findFlagByName :: String -> [Flag] -> Maybe Flag
findFlagByName flagName = find (\flag -> name flag == flagName)

isFlagSet :: String -> [Flag] -> Bool
isFlagSet flagName flags = case findFlagByName flagName flags of
  Just flag -> isSet flag
  Nothing -> False

setFlagByName :: String -> [Flag] -> [Flag]
setFlagByName flagName = map updateFlag
  where
    updateFlag flag
      | name flag == flagName = flag { isSet = True }
      | otherwise = flag

resetFlagByName :: String -> [Flag] -> [Flag]
resetFlagByName flagName = map updateFlag
  where
    updateFlag flag
      | name flag == flagName = flag { isSet = False }
      | otherwise = flag