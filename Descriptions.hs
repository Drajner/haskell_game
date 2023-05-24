module Descriptions where

introductionText = [
    "Miejsce: Planeta S4+KU",
    "Misja: Nie utonac ",
    "",
    "As Gwiezdnej Floty kapitan Tytus Bomba podczas pogoni za groznym przemytnikiem niekacyzowanych papierosow",
    "znanym jako Waldemar Krzak wlecial w orbite calkowicie pokrytej woda planety S4+KU. Przestepca pragnac ",
    "wymanewrowac poscig wlecial w sztorm. Zaloga Orzela 1 nie odstepowala go na krok. Niestety warunki atmosferyczne",
    "nie okazaly sie laskawe i stracily ich z przestworzy prosto w mroczne glebiny oceanu. Ich statek zatrzymal sie gdzies",
    "pomiedzy dnem, a powierzchnia. Teraz Kapitan Bomba oraz jego podwladni Janusz i Seba musza znalezc sposob, aby",
    "wydostac zniszczony upadkiem pojazd z tego potrzasku...",
    "",
    "'Zostawcie juz te cholerne karty i wezcie sie do roboty!'",
    "'Ale panie kapitanie my nie mamy pojecia co mamy tutaj zrobic, wiec przed smiercia mozemy sobie chociaz pograc.' - ",
    "odrzekl zrezygnowany zolnierz - 'Makao!'",
    "'Janusz, my gramy w pokera.' - upomnial kolege Seba ",
    "'I po makale! Znowu wygralem!'",
    "'Tepe...' - wypowiedz dowodcy przerwal nagly wstrzas.",
    "Cos musialo uderzyc w statek. To oznaczalo tylko jedno. Nalezy jak najszybciej opuscic to podle miejsce. Czas wziac sie ",
    "do roboty. Aby naprawic statek nalezy glowny silnik, ktory doznal najwiekszych obrazen podczas wypadku. Narzedzia ",
    "powinny byc gdzies na statku. Potrzebne beda: mlotek, klucz-francuski i srubokret.",
    ""
    ]

instructionsText = [
    "KOMENDY:",
    "idz - pozwala poruszac sie po statku i nie tylko (dostepne miejsca to dziob, pokoj, przod_ogona, tyl_ogona, sluza, skrzydlo_prawe, skrzydlo_lewe), przyklady: idz do pokoju, idz na dziob",
    "opis - wyswietla opis miejsca",
    "uzyj(przedmiot/obiekt). - uzywa pojedynczego przedmiotu (w przypadku skafandra uzycie oznacza zalozenie lub zdjecie), czasem pozwala na dolaczenie mniejszego przedmiotu do posiadanego wiekszego",
    "podnies(przdmiot) - pozwala wziac przedmiot do ekwipunku",
    "ekwipunek - wypisuje przedmioty ktore sa w ekwipunku",
    "zobacz(obiekt) - pozwala przyjrzec sie obiektowi lub kierunkowi",
    "rozmawiaj(rozmowca, temat) - pozwala na rozmowe z swiadomymi stworzeniami, o tematach im znanych (np. zolnierze i wyposazenie pokoju, janusz tematy wedkarskie)",
    "napraw_silnik. - pozwala naprawic silnik i ukonczyc gre, gdy w posiadaniu sa mlotek, srubokret i klucz-francuski, a takze jest sie na dziobie",
    "instrukcja. - pokazuje liste komend",
    "koniec          - ciekawe co robi ta komenda?",
    "Inne komendy moga sie pojawic w odpowiednim dla nich momencie.",
    ""
    ]


pokojCookingText = [
    "Przy stole samotnie siedzi Seba. Janusz dziala w kuchni. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1",
    "dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie malenka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."
    ]

pokojInitialText = [
    "Przy stole w pokoju pogrywajac w karty siedza Janusz i Seba. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1",
    "dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie malenka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych.",
    "Opodal wlazu do sluzy lezy skafander."
    ]

pokojSecondText = [
    "Przy stole w pokoju pogrywajac w karty siedza Janusz i Seba. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1",
    "dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie malenka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."
    ]

skrzydloLeweText = [
    "Lewe skrzydlo ma na sobie jeden stary silnik. Na szczescie ten nie został poturbowany tak bardzo."
    ]

skrzydloPraweText = [
    "Do prawego skrzydła przymocowany był silnik. Nie wygladal najgorzej, lecz moze wypadaloby do niego zajrzec."
    ]

sluzaText = [
    "Trzeszczaca od cisnienia sluza nie zadowalala swoja jakoscia jeszcze przed wypadkiem.",
    "Teraz jest jeszcze gorzej. Na szczescie panel kontrolny nadal dziala i mozna otworzyc sluze.",
    "[Aby otworzyc sluze wpisz 'otworz' lub 'zamknij', aby zamknac.]"
    ]

przodOgonaText = [
    "Oczom kapitana ukazuje sie szara, lekko oswietlona, podluzna przestrzen.",
    "Bomba moze zobaczyc co jest na lewo i na prawo."
    ]

tylOgonaFirstText = [
    "'Stoi tu niewielka skrzynka na narzedzia ... albo raczej na narzedzie. Jej rozmiar pozostawia wiele watpliwosci. Jest zamknieta na nietypowa klódke,",
    "sa na niej trzy przyciski: <^>v chyba nalezy je wcisnac w jakiejs sekwencji. Aby wpisac haslo napisz: wpisz [sekwencja]",
    "Bomba moze zobaczyc co jest na lewo i na prawo."
    ]

tylOgonaSecondText = [
    "W skrzynce jest klucz francuski (klucz-francuski)."
    ]

tylOgonaThirdText = [
    "Skrzyneczka stoi otworem."
    ]

dziobText = [
    "Kapitan znalazł się na dziobie statku. Na przedzie pomieszczenia charczy niesprawny silnik. Zeby opuscic to przeklete miejsce trzeba go naprawic.",
    "Na wysokiej szafie znajdujacej sie pod sciana lezy skrzynia. Bomba nie jest na tyle wysoki by do niej siednac. Gdzies tu powinien lezec mlotek, ",
    "jesli pamiec asa Gwiezdnej Floty go nie zawodzi."
    ]

repairFailToolsText = [
    "Naprawienie silnika bez odpowiednich narzedzi jest niemozliwe. Zaloga Orzela 1 rowniez bardzo by chciala, zeby tak sie dalo. Niestety cudow nie ma.",
    "Do naprawy maszynerii potrzeba mlotka, klucza francuskiego i srubokreta."
    ]

repairFailPlaceText = [
    "Glowny silnik statku, ktory wymaga naprawy jest na dziobie.",
    "Do naprawy maszynerii potrzeba mlotka, klucza francuskiego i srubokreta."
    ]

finaleText = [
    "Kapitan po mozolnych poszukiwaniach wreszcie mogl zabrac sie do roboty. Mogl przyjrzec sie silnikowi. Janusz i Seba spogladali na prace fachowca zza jego plecow.",
    "Bomba zlapal za mlotek i wyciagnal reke w strone podwladnych",
    "'Potrzymaj!' - burknal.",
    "Chwycil w lewa dlon srubokret, podrapal sie po plecach i stal chwile gapiac sie na maszyne w glebokim skupieniu." ,
    "W koncu wzial klucz francuski. Dokrecil nim zarowke znajdujaca sie ponad silnikem, po czym zadal kilka solidnych kopniakow w uszkodzony sprzet",
    "'Dobra. Bedzie dzialac. Chyba. Na miejsca, panowie. Opuszczamy te dziure' - skwitowal.",
    "Orzel 1 szczesliwie opuscil orbite S4+KU.",
    "ZWYCIESTWO" 
    ]