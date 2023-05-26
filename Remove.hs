module Remove where

import GameStatus
import Flag
import Descriptions

remove:: GameStatus -> [String] -> ([String], GameStatus, Bool)
remove status cmdWords = case last cmdWords of
    "skafander" -> if isFlagSet "skafanderZalozony" (getFlags status)
                    then if isFlagSet "sluzaOtwarta" (getFlags status)
                        then (removeSuitDeathText, status, True)
                        else if "chuda_ryba" `elem` getInventory status
                                then (removeSuitFishText, resetFlagInStatus (addToInventory status "skafander") "skafanderZalozony", False)
                                else (removeSuitText, resetFlagInStatus (addToInventory status "skafander") "skafanderZalozony", False)
                    else (["Nie mozna zdjac skafandra"], status, False)
                    
    "przynete" -> if ("wedka_z_zielona_przyneta" `elem` getInventory status) || ("wedka_z_czerwona_przyneta" `elem` getInventory status) || ("wedka_z_niebieska_przyneta" `elem` getInventory status)
                    then do
                        let newStatus = addToInventory (removeFromInventory (removeFromInventory (removeFromInventory status "wedka_z_zielona_przyneta") "wedka_z_czerwona_przyneta") "wedka_z_niebieska_przyneta") "wedka"
                        (removeBaitText, newStatus, False)
                    else (["Kapitan nie moze zdjac przynety."], status, False)

    "przynęte" -> if "wedka_z_zielona_przyneta" `elem` getInventory status || "wedka_z_czerwona_przyneta" `elem` getInventory status || "wedka_z_niebieska_przyneta" `elem` getInventory status
                    then do
                        let newStatus =addToInventory (removeFromInventory (removeFromInventory (removeFromInventory status "wedka_z_zielona_przyneta") "wedka_z_czerwona_przyneta") "wedka_z_niebieska_przyneta") "wedka"
                        (removeBaitText, newStatus, False)
                    else (["Kapitan nie moze zdjac przynety."], status, False)
    "przynętę"-> if "wedka_z_zielona_przyneta" `elem` getInventory status || "wedka_z_czerwona_przyneta" `elem` getInventory status || "wedka_z_niebieska_przyneta" `elem` getInventory status
                    then do
                        let newStatus =addToInventory (removeFromInventory (removeFromInventory (removeFromInventory status "wedka_z_zielona_przyneta") "wedka_z_czerwona_przyneta") "wedka_z_niebieska_przyneta") "wedka"
                        (removeBaitText, newStatus, False)
                    else (["Kapitan nie moze zdjac przynety."], status, False)
    "przynetę"-> if "wedka_z_zielona_przyneta" `elem` getInventory status || "wedka_z_czerwona_przyneta" `elem` getInventory status || "wedka_z_niebieska_przyneta" `elem` getInventory status
                    then do
                        let newStatus =addToInventory (removeFromInventory (removeFromInventory (removeFromInventory status "wedka_z_zielona_przyneta") "wedka_z_czerwona_przyneta") "wedka_z_niebieska_przyneta") "wedka"
                        (removeBaitText, newStatus, False)
                    else (["Kapitan nie moze zdjac przynety."], status, False)