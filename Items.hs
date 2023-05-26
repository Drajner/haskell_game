module Items where
import GameStatus
import Descriptions
import Flag

useItem :: GameStatus -> String -> ([String], GameStatus)
useItem status item = if item `elem` getInventory status
                        then case item of
                            "skafander"                 ->  do
                                                            let newStatus = setFlagInStatus status "skafanderZalozony"
                                                            (useSuitText, newStatus)
                            "wedka_bez_haczyka"         ->  (useFishingRodNoHookText, status)
                            "wedka"                     ->  (useFishingRodText, status)
                            "wedka_z_niebieska_przyneta"->  if getPosition status == "skrzydlo_prawe" && not(isFlagSet "grubaRubaZlapana" (getFlags status))
                                                                then do
                                                                    let newStatus = addToInventory (removeFromInventory ((addToInventory (setFlagInStatus status "grubaRybaZlapana") "gruba_ryba")) "wedka_z_niebieska_przyneta") "wedka"
                                                                    (useBlueRodSuccessText, newStatus)
                                                                else (useRodFailText, status)
                            "wedka_z_zielona_przyneta"  ->  (useRodFailText, status)
                            "wedka_z_czerwona_przyneta" ->  (useRodFailText, status)
                            "czerwona_przyneta"         ->  if "wedka" `elem` getInventory status
                                                                then do
                                                                    let newStatus = addToInventory (removeFromInventory status "wedka") "wedka_z_czerwona_przyneta"
                                                                    (useRedBaitSuccessText, status)
                                                                else (useBaitFailText, status)
                            "zielona_przyneta"          ->  if "wedka" `elem` getInventory status
                                                                then do
                                                                    let newStatus = addToInventory (removeFromInventory status "wedka") "wedka_z_zielona_przyneta"
                                                                    (useGreenBaitSuccessText, status)
                                                                else (useBaitFailText, status)
                            "niebieska_przyneta"        ->  if "wedka" `elem` getInventory status
                                                                then do
                                                                    let newStatus = addToInventory (removeFromInventory status "wedka") "wedka_z_niebieska_przyneta"
                                                                    (useBlueBaitSuccessText, status)
                                                                else (useBaitFailText, status)
                            "mlotek"                    ->  if not(isFlagSet "chudaRybaZlapana" (getFlags status)) && getPosition status == "skrzydlo_lewe"
                                                                then do
                                                                    let newStatus = addToInventory (setFlagInStatus status "chudaRybaZlapana") "chuda_ryba"
                                                                    (useHammerOnFishText, newStatus)
                                                                else if not(isFlagSet "szklaneDrzwiczkiOtwarte" (getFlags status)) && getPosition status == "przod_ogona"
                                                                        then do
                                                                            let newStatus = setFlagInStatus status "szklaneDrzwiczkiOtwarte"
                                                                            (useHammerGlassDoorText, newStatus)
                                                                        else (useHammerFailText, status)
                            "drabina"                   -> if getPosition status == "dziob"
                                                                then do
                                                                    let newStatus = addItemToGameByRoom status "mlotek" "dziob"
                                                                    (useLadderText, newStatus)
                                                                else (useGeneralFailText, status)
                            "kula_do_kregli"            -> if "szalik" `elem` getInventory status
                                                            then do
                                                                let newStatus = removeFromInventory (removeFromInventory (addToInventory status "kula_w_szaliku") "kula_do_kregli") "szalik"
                                                                (useBallScarfText, newStatus)
                                                            else (useGeneralFailText, status)
                            "szalik"                    -> if "kula_do_kregli" `elem` getInventory status
                                                            then do
                                                                let newStatus = removeFromInventory (removeFromInventory (addToInventory status "kula_w_szaliku") "kula_do_kregli") "szalik"
                                                                (useBallScarfText, newStatus)
                                                            else (useGeneralFailText, status)
                            "kula_w_szaliku"            -> if not(isFlagSet "szklaneDrzwiczkiOtwarte" (getFlags status)) && getPosition status == "przod_ogona"
                                                                        then do
                                                                            let newStatus = setFlagInStatus status "szklaneDrzwiczkiOtwarte"
                                                                            (useHammerGlassDoorText, newStatus)
                                                                        else (useGeneralFailText, status)
                            "haczyk"                    -> if getPosition status == "tyl_ogona" && not(isFlagSet "farbaZdrapana" (getFlags status))
                                                                then do
                                                                    let newStatus = setFlagInStatus status "farbaZdrapana"
                                                                    (useHookOnPaintText, newStatus)
                                                                else if "wedka_bez_haczyka" `elem` getInventory status 
                                                                        then do
                                                                            let newStatus = removeFromInventory (removeFromInventory (addToInventory status "wedka") "wedbka_bez_haczyka") "haczyk"
                                                                            (useHookOnRodText, newStatus)
                                                                        else (useHookHintText, status)
                            "srubokret"                 -> if getPosition status == "tyl_ogona" && not(isFlagSet"farbaZdrapana" (getFlags status))
                                                                then do
                                                                    let newStatus = setFlagInStatus status "farbaZdrapana"
                                                                    (useHookOnPaintText, newStatus)
                                                                else if "wedka_bez_haczyka" `elem` getInventory status 
                                                                        then do
                                                                            let newStatus = removeFromInventory (removeFromInventory (addToInventory status "wedka") "wedbka_bez_haczyka") "haczyk"
                                                                            (useHookOnRodText, newStatus)
                                                                        else (useHookHintText, status)
                        else (["Kapitan nie dysponuje takim przedmiotem."], status)

-- need to do zdejmij command