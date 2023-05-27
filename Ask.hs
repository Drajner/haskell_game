module Ask where
import GameStatus
import Flag
import Descriptions


askAbout :: GameStatus -> String -> String -> ([String],GameStatus)
askAbout status asked topic = if isFlagSet "skafanderZalozony" (getFlags status)
    then (askInSuitText, status)
    else case asked of
            "janusz"        -> if getPosition status == "pokoj"
                                    then case topic of
                                        "kuchnia"   -> (askJanuszKitchenText, status)
                                        "szafka"    -> if isFlagSet "kluczJanuszaWydany" (getFlags status)
                                                            then (askJanuszLockerTwiceText, status)
                                                            else (askJanuszLockerText, setFlagInStatus (addToInventory status "klucz_do_szafki_janusza") "kluczJanuszaWydany")
                                        "skafander" -> (askJanuszSuitText, status)
                                        "chuda_ryba"-> if "chuda_ryba" `elem` getInventory status
                                                            then (askJanuszSlimFishText, status)
                                                            else (askJanuszLockerText, setFlagInStatus (addToInventory status "klucz_do_szafki_janusza") "kluczJanuszaWydany")
                                        "wedka"     -> if "wedka" `elem` getInventory status
                                                            then (askJanuszRodText, status)
                                                            else (getJanuszHintText status, status)
                                        "przynety"  -> if isFlagSet "szafkaJanuszaOtwarta" (getFlags status)
                                                            then (askJanuszBaitText, status)
                                                            else (getJanuszHintText status, status)
                                        "gruba_ryba"-> if "gruba_ryba" `elem` getInventory status
                                                            then do
                                                                let newStatus = setFlagInStatus (removeFromInventory (removeFromInventory (addToInventory status "srubokret") "gruba_ryba") "chuda_ryba") "januszGotuje"
                                                                (askJanuszFatFishText, newStatus)
                                                            else (getJanuszHintText status, status)
                                        "wedka_bez_haczyka" -> if "wedka_bez_haczyka" `elem` getInventory status
                                                                then (askJanuszRodNoHookText, status)
                                                                else (getJanuszHintText status, status)
                                        _                   -> (getJanuszHintText status, status)
                                    else (["Nie ma tu takiego rozmowcy."], status)
            "seba"          -> if getPosition status == "pokoj"
                                    then case topic of
                                        "kuchnia"   -> (askSebaKitchenText, status)
                                        "szafka"    -> (askSebaLockerText, status)
                                        "skafander" -> (askSebaSuitText, status)
                                        _           -> (askSebaHint, status)
                                    else (["Nie ma tu takiego rozmowcy."], status)
            "chuda_ryba"    -> if "chuda_ryba" `elem` getInventory status 
                                then case topic of
                                    "zona"       -> (askSlimFishWifeText, status)
                                    "mieszkanie" -> (askSlimFishFlatText, status)
                                    "matka"      -> (askSlimFishMomText, status)
                                    _            -> (askSlimFishText, status)
                                else (["Nie ma tu takiego rozmowcy."], status)
            "gruba_ryba"    -> if "gruba_ryba" `elem` getInventory status 
                                then (askFatFishText, status)
                                else (["Nie ma tu takiego rozmowcy."], status)
            _ -> (["Nie ma tu takiego rozmowcy."], status)


getJanuszHintText :: GameStatus -> [String]
getJanuszHintText status = do
    let baseHint = ["Janusza mozna zapytac o :","skafander","kuchnie","szafke"]
    if "chuda_ryba" `elem` getInventory status
    then "chuda_ryba" : baseHint
    else baseHint
      ++
      if "wedka" `elem` getInventory status
        then ["wedka"]
        else []
      ++
      if isFlagSet "szafkaJanuszaOtwarta" (getFlags status)
        then ["przynety"]
        else []
      ++
      if "wedka_bez_haczyka" `elem` getInventory status
        then ["wedka_bez_haczyka"]
        else []

polishCompensationAsked :: [String] -> String
polishCompensationAsked cmdWords = case head (tail cmdWords) of
    "Janusza" -> "janusz"
    "janusza" -> "janusz"
    "janusz" -> "janusz"
    "Janusz" -> "janusz"
    "Sebe" -> "seba"
    "Sebę" -> "seba"
    "sebe" -> "seba"
    "sebę" -> "seba"
    "seba" -> "seba"
    "Seba" -> "seba"
    "ryba" -> if "gruba" `elem` cmdWords || "grubą" `elem` cmdWords 
                then "gruba_ryba"
                else "chuda_ryba"
    "rybę" -> if "gruba" `elem` cmdWords || "grubą" `elem` cmdWords 
                then "gruba_ryba"
                else "chuda_ryba"
    "rybe" -> if "gruba" `elem` cmdWords || "grubą" `elem` cmdWords 
                then "gruba_ryba"
                else "chuda_ryba"
    "chudą_rybą" -> "chuda_ryba"
    "chudą_ryba" -> "chuda_ryba"
    "chuda_rybą" -> "chuda_ryba"
    "gruba_rybą" -> "gruba_ryba"
    "grubą_ryba" -> "gruba_ryba"
    "gruba_rybą" -> "gruba_ryba"
    _ -> head (tail cmdWords)

polishCompensationTopic :: [String] -> String
polishCompensationTopic cmdWords = case last cmdWords of
    "szafki" -> "szafka"
    "szafke" -> "szafka"
    "szafkę" -> "szafka"
    "szafka" -> "szafka"
    "kuchnia" -> "kuchnia"
    "kuchnie" -> "kuchnia"
    "kuchnię" -> "kuchnia"
    "wedka"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "wedke"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "wedkę"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "wędkę"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "wędke"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "wedki"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "wędki"     ->  if "haczyka" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else "wedka"
    "haczyka"   -> if ("wedka" `elem` cmdWords || "wędka" `elem` cmdWords) && "bez" `elem` cmdWords
                        then "wedka_bez_haczyka"
                        else last cmdWords
    "wedke_bez_haczyka" -> "wedka_bez_haczyka"
    "wedkę_bez_haczyka" -> "wedka_bez_haczyka"
    "wędkę_bez_haczyka" -> "wedka_bez_haczyka"
    "wędke_bez_haczyka" -> "wedka_bez_haczyka"
    "przyneta" -> "przynety"
    "przynety" -> "przynety"
    "przynęty" -> "przynety"
    "przynęta" -> "przynety"
    "przynętę" -> "przynety"
    "przynete" -> "przynety"
    "przynetę" -> "przynety"
    "przynęte" -> "przynety"
    "ryba"      -> if "chuda" `elem` cmdWords || "chudą"  `elem` cmdWords
                        then "chuda_ryba"
                        else if "gruba" `elem` cmdWords || "grubą"  `elem` cmdWords
                            then "gruba_ryba"
                            else last cmdWords
    "rybe"      -> if "chuda" `elem` cmdWords || "chudą"  `elem` cmdWords
                        then "chuda_ryba"
                        else if "gruba" `elem` cmdWords || "grubą"  `elem` cmdWords
                            then "gruba_ryba"
                            else last cmdWords
    "rybę"      -> if "chuda" `elem` cmdWords || "chudą"  `elem` cmdWords
                        then "chuda_ryba"
                        else if "gruba" `elem` cmdWords || "grubą"  `elem` cmdWords
                            then "gruba_ryba"
                            else last cmdWords
    "zona" -> "zona"
    "żona" -> "zona"
    "zone" -> "zona"
    "żonę" -> "zona"
    "żone" -> "zona"
    "zonę" -> "zona"
    "matka" -> "matka"
    "matkę" -> "matka"
    "matke" -> "matka"
    _ -> last cmdWords