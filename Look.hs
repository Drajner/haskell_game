module Look where

import GameStatus
import Descriptions
import Flag



lookAt :: GameStatus -> String -> ([String], GameStatus)
lookAt status object = case object of
    "kalendarz"         -> if getPosition status == "pokoj"
                                then (lookCalendarText, status)
                                else (lookFailText, status)
    "kuchnia"           -> if getPosition status == "pokoj"
                                then if isFlagSet "januszGotuje" (getFlags status)
                                        then (lookKitchenCookingText, status)
                                        else (lookKitchenNormalText, status)
                                else (lookFailText, status)
    "skafander"         -> if getPosition status == "pokoj"
                                then if isFlagSet "klodaOtwarta" (getFlags status)
                                        then (lookSuitText, status)
                                        else (lookSuitClosedText, setFlagInStatus status "skafanderZbadany")
                                else (lookFailText, status)
    "szafki"            -> if getPosition status == "pokoj"
                                then (lookLockersText, status)
                                else (lookFailText, status)
    "silnik"            -> case getPosition status of
                            "skrzydlo_lewe"     -> if isFlagSet "chudaRybaZlapana" (getFlags status)
                                                        then (lookLeftEngineEmptyText, status)
                                                        else (lookLeftEngineText, status)
                            "skrzydlo_prawe"    -> if isFlagSet "grubaRybaZlapana" (getFlags status)
                                                        then (lookRightEngineEmptyText, status)
                                                        else (lookRightEngineText, status)
                            _                   -> (lookFailText, status)
    "szafa"             -> if getPosition status == "dziob"
                                then if isFlagSet "drabinaPozaSzafa" (getFlags status)
                                        then (lookCabinetEmptyText, status) 
                                        else (lookCabinetText, addItemToGameByRoom (resetFlagInStatus status "drabinaPozaSzafa") "drabina" "dziob")
                                else (lookFailText, status)
    "szklane_drzwiczki" -> if getPosition status == "przod_ogona"
                                then if isFlagSet "szklaneDrzwiczkiOtwarte" (getFlags status)
                                        then (lookGlassDoorOpenText, status)
                                        else (lookGlassDoorText, status)
                                else (lookFailText, status)
    "dolne_drzwiczki"   -> if getPosition status == "przod_ogona"
                                then (lookLowerDoorOpenText, status)
                                else (lookFailText, status)
    _                   -> (lookFailText, status)
