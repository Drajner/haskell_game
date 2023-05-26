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
    "Po prawej stronie stoi brzydki kredens, może nawet starszy od calego tego gruchota.",
    "Gore mebla stanowi polka zablokowana szklanymi, nieprzezroczystymi drzwiczkami.",
    "Pod oszklona czescia jest polka, a jeszcze nizej kolejne, tym razem drewniane, drziwczki."
    ]

tylOgonaFirstText = [
    "Tyl ogona stanowi niewielka kanciapa. Stoi tu niewielka skrzynka na narzedzia ... albo raczej na narzedzie.",
    "Jej rozmiar pozostawia wiele watpliwosci. Jest zamknieta na nietypowa klodke,",
    "sa na niej trzy przyciski: <^>v chyba nalezy je wcisnac w jakiejs sekwencji. Aby wpisac haslo napisz: wpisz [sekwencja]",
    "Na prawej scianie tego obskurnego pomieszczenia z nieznanego nikomu powodu wisi obrazek wsi polskiej.",
    "Jeden szczegol zwraca uwage … na polu stoi sobie pies o trzech nogach. Biedak musial wiele przezyc."
    ]

tylOgonaSecondText = [
    "Tyl ogona stanowi niewielka kanciapa. Stoi tu niewielka skrzynka na narzedzia ... albo raczej na narzedzie.",
    "Jej rozmiar pozostawia wiele watpliwosci. Skrzyneczka stoi otworem,",
    "Na prawej scianie tego obskurnego pomieszczenia z nieznanego nikomu powodu wisi obrazek wsi polskiej.",
    "Jeden szczegol zwraca uwage … na polu stoi sobie pies o trzech nogach. Biedak musial wiele przezyc."
    ]

tylOgonaFirstSubtext = [
        "Farba na niebie wyglada na swiezsza od reszty. Ktos chyba chcial cos zamalowac."
    ]

tylOgonaSecondSubtext =[
        "Na niebie jest napisane “mcsldctc”, pewnie jakis analfabeta to pisal."
    ]

tylOgonaSzalikSubtext = [
        "W kacie lezy szalik z napisem POLSKA MISTRZEM POLSKI w kolorach bialym i czerwonym."
    ]

dziobText = [
    "Kapitan znalazł się na dziobie statku. Na przedzie pomieszczenia charczy niesprawny silnik. Zeby opuscic to przeklete miejsce trzeba go naprawic.",
    "Na wysokiej szafie znajdujacej sie pod sciana lezy skrzynia. Bomba nie jest na tyle wysoki by do niej siednac. Gdzies tu powinien lezec mlotek, ",
    "jesli pamiec asa Gwiezdnej Floty go nie zawodzi."
    ]

repairFailToolsText = [
    "Naprawienie silnika bez odpowiednich narzedzi jest prawdopodobnie niemozliwe. Zaloga Orzela 1 rowniez bardzo by chciala, zeby tak sie dalo. Niestety cudow nie ma.",
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

sluzaDeathText = [
    "Otwarcie sluzy bez zadnego zabezpieczenia nie bylo najrozsadniejszym pomyslem.",
    "Wejscie na statek zostalo zablokowane, a woda sprawnie zaczela wypelniac pomieszczenie wypierajac tlen.",
    "Po chwili nie bylo juz czym oddychac. Kapitan utonal zanim zdazyl sklac wszystkich projektantów tego statku.",
    "KONIEC GRY"
    ]


lookCalendarText = [
    "Modelka kusi oczy kapitana. To juz koncowka marca.",
    "Dokladniej 26 marca 2039 roku. Za 2 tygodnie powinna przyjsc wyplata i znowu bedzie sie mozna napic.",
    "Byleby nie skonczyc tak jak w Nowy Rok dwa lata temu. Wtedy to byla tragedia... Przez bite dwa dni Bomba byl nie do zycia.",
    "Ledwo prowadzil rakiete. Nie dotarl na narodziny swojego syna, chociaz i tak by tego nie pamietal.",
    "Dzien po pierwszym stycznia nie zatrzymal sie w jego pamieci. Aldona nadal ma mu to za zle."
    ]

lookKitchenCookingText = [
    "Janusz usilnie próbuje dojsc do porozumienia z otaczajacym go syfem.",
    "Patrzac na tempo jego dzialan kapitan dochodzi do wniosku, ze chwile to potrwa zanim dostana kolacje."
    ]

lookKitchenNormalText = [
    "Potworny syf rzucal sie w oczy. Brudne naczynia lezaly wszedzie."
    ]

lookSuitClosedText = [
    "Gwiezdna Flota postanowila wyposazyc statki 'nowoczesne', 30-letnie skafandry, UBERSPEIMACHER419.",
    "Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo.",
    "Gwiezdna Flota jak widac nie oszczedza na bezpieczenstwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos.",
    "Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci.",
    "Niestety skafander zostal zablokowany klódka z zamkiem na 4 cyfry i przypieta karteczka z napisem:",
    "'Kod to data urodzin naszego Brajanka, mam nadzieje ze pamietasz!'",
    "'Kurrr...' - wycedzil przez zeby Bomba. - 'Trudne...'",
    "[Aby podac kod do klodki, wpisz XXXX]"
    ]

lookSuitText = [
    "Gwiezdna Flota postanowila wyposazyc statki 'nowoczesne', 30-letnie skafandry, UBERSPEIMACHER419.",
    "Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo.",
    "Gwiezdna Flota jak widac nie oszczedza na bezpieczenstwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos.",
    "Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci."
    ]

lookLockersText = [
    "Szafki nalezace do Janusza i Seby byly zamkniete na klucz. Zapewne kazdy z nich ma swój klucz.",
    "[Jesli kapitan dysponuje kluczem moze skorzystac z komendy otworz szafke Janusza lub otworz szafke Seby.]"
    ]

lookLockersOpenText = [
    "Szafka Seby nadal jest zamknieta. Szafka nalezaca do Janusza jest otwarta i pusta."
    ]

suitCodeSuccessText = [
    "'Nareszcie... 02.01.2037. Aldona nie moglas czegos latwiejszego wybrac?' - wyrzucil pod nosem Bomba otwierajac zamek.",
    "Teraz mozna zabrac skafander [komenda podnies]. Aby zalozyc skafander wykorzystaj komende uzyj, a zeby zdjac komende zdejmij."
    ]

suitCodeFailText = [
    "Palaki klódki nie puszczaly niczym Mariusz Pudzianowski malego fiata w Silaczach.",
    "'To nie to... kiedy to bylo?' - zastanawial sie sfrustrowany kapitan."
    ]

suitCodeUnknownText = [
    "Nie ma tu nic co mogloby przyjac kod."
    ]

openSebaLockerText = [
    "Szafka Seby niestety jest zamknieta i bez klucza moze byc niemozliwa do otwarcia."
    ]

openJanuszLockerText = [
    "Po krótkiej, lecz uciazliwej szamotaninie z przyrdzewialym zamkiem szafki, Bombie udalo sie otworzyc szafke podkomendnego.",
    "Niestety potyczka poskutkowala powaznymi stratami, klucz utknal w drzwiczkach i za nic nie chce ich opuscic.",
    "Na podloge pokoju z impetem wylecialy wedka_bez_haczyka oraz czerwona_przyneta, zielona_przyneta, niebieska_przyneta.",
    "Niestety wedka moze byc problematyczna w uzyciu bez haczyka."
    ]

openJanuszLockerFailText = [
    "Ciezko byloby otworzyc szafke bez klucza."
    ]

openJanuszLockerAgainText = [
    "Pusta szafka stoi juz otworem."
    ]

lookLeftEngineText = [
    "Stary, trzymajacy sie jeszcze silnik zostal zamieszkaly przez chuda rybe. Niestety jest ona poza zasiegiem reki kapitana.",
    "Moze udaloby sie ja wyploszyc przy uzyciu mlotka?"
    ]

lookLeftEngineEmptyText = [
    "Silnik jest pusty..."
    ]

lookRightEngineText = [
    "Wewnatrz silnika rezyduje potezna, gruba ryba. Bomba zdecydowal sie nie ryzykowac wkladania tam reki.",
    "Moze daloby sie wywabic jakos ta rybe z tego silnika"
    ]

lookRightEngineEmptyText = [
    "Silnik jest pusty..."
    ]

lookCabinetText = [
    "Wewnatrz obszernej metalowej szafy znajduje sie drabina. Oby tylko wytrzymala ciezar kapitana."
    ]

lookCabinetEmptyText = [
    "Szafa jest pusta."
    ]

lookGlassDoorText = [
    "Kapitan zlapal za uchwyt szklanych drzwiczek.",
    "'Ani drgna, chyba sie zaciely.' - mruknal pod nosem"
    ]

lookGlassDoorOpenText = [
    "Ktos widocznie gral na tyle w kólko i krzyzyk. W dodatku bardzo nieudolnie.",
    "'Co za debile, nie wiedzieli jak sie w to gra? Przeciez nawet w nazwie jest kolko i krzyzyk. A tutaj?' - pomyslal",
    "< | x | o",
    "—--------",
    "o | o | >",
    "—--------",
    "^ | ^ | >"
    ]

lookLowerDoorText = [
    "Zamkniete, na klódce jest klawiatura literowa do wpisania hasla, limit to 8 znaków. (haslo(dolne_drzwiczki, [haslo]))"
    ]

lookLowerDoorJustOpenText = [
    "W srodku jest kula do kregli."
    ]

lookLowerDoorOpenText = [
    "Szafka za dolnymi drzwiczkami jest pusta."
    ]

lookLowerDoorOpenFailText = [
    "Niestety, wyglada na to ze to haslo nie jest poprawne."
    ]

openToolboxText = [
    "Po wcisnieciu tej sekwencji, skrzynka otwiera sie. Wewnatrz znajduje sie klucz_francuski."
    ]

useSuitText = [
    "Wpychajac sie w cuchnacy, starozytny juz ekwipunek, zauwazyl, ze przez lepiej wewnatrz tego zlomu nie oddalac sie zanadto od statku, ",
    "bo bezpieczniej byloby juz pomylic szubienice z bungee. Nie dosc, ze poruszanie sie w tym zelastwie jest trudnoscia, ",
    "to przez helm absolutnie nic nie slychac i nie da sie rozmawiac."
    ]

useFishingRodNoHookText = [
    "Wedka bez haczyka mozna sobie oczywiscie pomachac i poudawac, ze lowi sie ryby, ale nie przyniesie to efektów."
    ]

useFishingRodText = [
    "Do lowienia przydalaby sie jeszcze przyneta"
    ]

useBlueRodSuccessText = [
    "Potezna wodna bestia wyplynela z silnika i pochwycila niebieska przynete. Kapitan musial sie wysilic by zlapac tego potwora.",
    "[Do ekwipunku dodano gruba_ryba oraz zamieniono wedka_z_niebieska_przyneta na wedka.]"
    ]

useRodFailText = [
    "Nic nie chce chwycic za ta przynete."
    ]

useBaitFailText = [
    "Kapitan nie ma jak uzyc tej przynety."
    ]

useRedBaitSuccessText = [
    "Bomba zaklada czerwona przynete na wedke",
    "[Poprzednia wedka staje sie wedka_z_czerwona_przyneta, aby zdjac przynete zdejmij_przynete.]"
    ]

useGreenBaitSuccessText = [
    "Bomba zaklada zielona przynete na wedke",
    "[Poprzednia wedka staje sie wedka_z_zielona_przyneta, aby zdjac przynete zdejmij_przynete.]"
    ]

useBlueBaitSuccessText = [
    "Bomba zaklada niebieska przynete na wedke",
    "[Poprzednia wedka staje sie wedka_z_niebieska_przyneta, aby zdjac przynete zdejmij_przynete.]"
    ]

removeBaitText = [
    "Bomba zdejmuje przynete z wedki.",
    "[Kapitan ponownie zyskuje wedka.]"
    ]

useHammerOnFishText = [
    "Kapitan Bomba wielokrotnie uderza mlotkiem w silnik, aby wyploszyc rybe, a ta wyplywa prosto w jego rece.",
    "[Zdobyto chuda_ryba]"
    ]

useHammerFailText = [
    "Brak tu dobrego celu do tluczenia."
    ]

useHammerGlassDoorText = [
    "Kapitan zamachnal sie ciezkim przedmiotem i jednym celnym uderzeniem roztrzaskal na kawałki szklane drzwiczki.",
    "Ktos widocznie gral na tyle w kólko i krzyzyk. W dodatku bardzo nieudolnie.",
    "'Co za debile, nie wiedzieli jak sie w to gra? Przeciez nawet w nazwie jest kolko i krzyzyk. A tutaj?' - pomyslal",
    "< | x | o",
    "—--------",
    "o | o | >",
    "—--------",
    "^ | ^ | >"
    ]

useHookOnPaintText = [
    "Na niebie jest napisane “mcsldctc”, pewnie jakis analfabeta to pisal."
    ]

useHookOnRodText = [
    "Kapitan przywiazal haczyk do wedki.",
    "[Z ekwipunku znikaja wedka_bez_haczyka i haczyk, a pojawia sie wedka.]"
    ]

useHookHintText = [
    "Co by zrobic z tym haczykiem? Pewnie przydalaby sie jakas wedka..."
    ]

useLadderText = [
    "Kapitan po wgramoleniu sie na szczyt drabiny znajduje w skrzyni mlotek."
    ]

useGeneralFailText = [
    "Nie ma tu jak uzyc tego przedmiotu"
    ]

useBallScarfText = [
    "Kapitan dzieki swej nieograniczonej wyobrazni wklada kule do szalika, aby utworzyc ciezki przedmiot na ksztalt cepa.",
    "Mozna tym cos rozwalic albo zabic.",
    "Przedmiot kula_w_szaliku laduje w ekwipunku."
    ]