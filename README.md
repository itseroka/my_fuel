Witaj w kalkulatorze norm spalania, będziesz poproszony o numer rejestracyjny pojazdu, date wyjazdu, datę powrotu, stan początkowy paliwa, dodatnkowania oraz stan końcowy paliwa żeby obliczyć normę zużycia paliwa l/100 km.

_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

Uruchom: bundle exec rackup

_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

Work in progress...

_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

Klasa Apka:
Ta klasa jest podklasą klasy Sinatra::Base i służy do definiowania aplikacji internetowych za pomocą frameworku Sinatra. Wszystkie funkcjonalności, takie jak obsługa tras, żądań HTTP itp., będą implementowane w tej klasie lub jej podklasach.

Metoda get '/':
Ta metoda obsługuje żądanie typu GET na głównym adresie URL. Po wykonaniu żądania, metoda odczytuje wartość ciasteczka o nazwie "message" z żądania i przypisuje ją do zmiennej instancyjnej @message. Następnie usuwa ciasteczko o nazwie "message" z odpowiedzi. Po tym wszystkim renderuje widok index.erb z zastosowaniem układu layout.erb.

Metoda post '/szukaj':
Ta metoda obsługuje żądanie typu POST na adresie URL "/szukaj". Po wykonaniu żądania, metoda odczytuje wartość parametru numer_pojazdu z żądania i przekształca ją na wielkie litery za pomocą metody upcase. Następnie tworzy ścieżkę do pliku raportu na podstawie numeru pojazdu i przypisuje ją do zmiennej @raport_path. Jeśli plik raportu istnieje, metoda odczytuje jego zawartość, parsuje go jako plik CSV i przypisuje wynik do zmiennej @item. Dodatkowo przypisuje wartość numeru pojazdu do zmiennej @numer_pojazdu. Następnie renderuje widok zawartosc_pliku.erb. Jeśli plik raportu nie istnieje, ustawia zmienną @error_message na wartość informującą o braku danych dla podanego numeru rejestracyjnego i renderuje widok szukaj.erb.

Użyty język programowania to Ruby, a kod opiera się na frameworku Sinatra, który służy do tworzenia aplikacji internetowych w języku Ruby.
  
Metoda get '/szukaj':
Ta metoda obsługuje żądanie typu GET na adresie URL "/szukaj". Po wykonaniu żądania, metoda pobiera listę plików w katalogu "./data" za pomocą metody Dir.entries. Następnie odrzuca pliki będące katalogami i przypisuje pozostałe pliki do zmiennej instancyjnej @pliki. Następnie tworzy tablicę @nazwy_plikow, w której dla każdego pliku tworzy parę wartości [plik, nazwa_pliku], gdzie plik to nazwa pliku z rozszerzeniem, a nazwa_pliku to nazwa pliku bez rozszerzenia. Renderuje widok szukaj.erb, przekazując zmienne @pliki i @nazwy_plikow do widoku.

Metoda get '/pobierz_zawartosc':
Ta metoda obsługuje żądanie typu GET na adresie URL "/pobierz_zawartosc". Po wykonaniu żądania, metoda odczytuje wartość parametru plik z żądania i przypisuje ją do zmiennej instancyjnej @plik. Następnie odczytuje zawartość pliku o nazwie @plik za pomocą metody File.read i przypisuje ją do zmiennej lokalnej zawartosc. Podobnie jak w poprzedniej metodzie, pobiera listę plików w katalogu "./data" i przypisuje je do zmiennej instancyjnej @pliki. Tworzy tablicę @nazwy_plikow z nazwami plików bez rozszerzeń. Następnie przetwarza zawartość pliku jako plik CSV i przypisuje wynik do zmiennej instancyjnej @item. Dodatkowo przypisuje nazwę pliku (nazwa_pliku) na podstawie wartości @plik z tablicy @nazwy_plikow. Renderuje widok zawartosc_pliku.erb, przekazując zmienne @plik, @nazwa_pliku i @item do widoku.

Metoda post '/wyjazd':
Ta metoda obsługuje żądanie typu POST na adresie URL "/wyjazd". Po wykonaniu żądania, tworzy nową instancję klasy Przejazd i przekazuje do konstruktora parametr numer_pojazdu (wcześniej przekształcony na wielkie litery). Wywołuje metodę wyjazd na obiekcie przejazd, przekazując wartości parametrów data_wyjazdu, km_wyjazd i paliwo_wyjazd. Następnie ustawia ciasteczko o nazwie "message" na wartość zwróconą przez metodę message obiektu przejazd. Przekierowuje żądanie na adres URL

Metoda post '/tankowanie':
Ta metoda obsługuje żądanie typu POST na adresie URL "/tankowanie". Po wykonaniu żądania, tworzy nową instancję klasy Przejazd i przekazuje do konstruktora parametr numer_pojazdu (wcześniej przekształcony na wielkie litery). Następnie przetwarza wartości parametru paliwo_dodatkowo jako tablicę liczb zmiennoprzecinkowych. Oblicza sumę wartości z tej tablicy i przypisuje ją do zmiennej suma_paliwa. Wywołuje metodę dodaj_tankowanie na obiekcie przejazd, przekazując wartości parametrów data_tankowania i suma_paliwa. Następnie ustawia ciasteczko o nazwie "message" na wartość zwróconą przez metodę message obiektu przejazd. Przekierowuje żądanie na adres URL "/" (strona główna).

Metoda post '/zjazd':
Ta metoda obsługuje żądanie typu POST na adresie URL "/zjazd". Po wykonaniu żądania, tworzy nową instancję klasy Przejazd i przekazuje do konstruktora parametr numer_pojazdu (wcześniej przekształcony na wielkie litery). Wywołuje metodę dodaj_powrot na obiekcie przejazd, przekazując wartości parametrów data_zjazdu, km_powrot i paliwo_zjazd. Następnie ustawia ciasteczko o nazwie "message" na wartość zwróconą przez metodę message obiektu przejazd. Przekierowuje żądanie na adres URL "/" (strona główna).

Metoda post '/cala_trasa':
Ta metoda obsługuje żądanie typu POST na adresie URL "/cala_trasa". Po wykonaniu żądania, tworzy nową instancję klasy Przejazd i przekazuje do konstruktora parametr numer_pojazdu (wcześniej przekształcony na wielkie litery). Podobnie jak w poprzednich metodach, przetwarza wartości parametru paliwo_dodatkowo jako tablicę liczb zmiennoprzecinkowych i oblicza ich sumę, przypisując ją do zmiennej suma_paliwa. Wywołuje metodę cala_trasa na obiekcie przejazd, przekazując wartości wszystkich parametrów związanych z całym przejazdem. Następnie ustawia ciasteczko o nazwie "message" na wartość zwróconą przez metodę message obiektu przejazd. Przekierowuje żądanie na adres URL "/" (strona główna).

Klasa Przejazd:
Ta klasa służy do reprezentowania informacji o przejazdach. Posiada jedno atrybutu tylko do odczytu, message, który przechowuje wiadomość związane z przejazdem.

Metoda attr_reader :message:
Ta metoda generuje automatyczny getter dla atrybutu message, co umożliwia odczytywanie wartości tego atrybutu z zewnątrz obiektu klasy Przejazd. Nie ma możliwości bezpośredniej modyfikacji tego atrybutu z zewnątrz, ponieważ nie został zdefiniowany setter.

Użyty język programowania to Ruby, a kod reprezentuje definicję klasy Przejazd oraz generowanie gettera dla atrybutu message przy użyciu metody attr_reader.

Metoda initialize:
Ta metoda jest konstruktorem dla klasy Przejazd i przyjmuje parametr numer_pojazdu. Inicjalizuje atrybuty @numer_pojazdu i @raport_path przyjmując wartość parametru numer_pojazdu oraz tworząc ścieżkę do pliku raportu na podstawie tego numeru. Następnie, jeśli plik raportu istnieje, odczytuje jego zawartość i przypisuje wartości odpowiednich zmiennych, takie jak numer_trasy_csv i ostatnie_polecenie, na podstawie danych w pliku CSV.

Metoda wyjazd(data_wyjazdu, km_wyjazd, paliwo_wyjazd):
Ta metoda rejestruje wyjazd dla pojazdu. Sprawdza, czy plik raportu istnieje. Jeśli tak, odczytuje ostatnie polecenie i numer trasy z pliku. Następnie na podstawie ostatniego polecenia podejmuje odpowiednie działania:

Jeśli ostatnie polecenie to "Norma", dodaje nowy wiersz do pliku raportu zawierający informacje o wyjeździe.
Jeśli ostatnie polecenie to "Wyjazd" lub "Tankowanie", oznacza, że poprzedni przejazd nie został zakończony, więc zwraca odpowiednią wiadomość.
W przeciwnym razie, gdy plik raportu nie istnieje lub nie zawiera żadnych danych, tworzy nowy plik raportu i dodaje pierwszy wiersz z informacjami o wyjeździe.
Na koniec ustawia atrybut @message na odpowiednią wiadomość i zwraca tę wiadomość.

Metoda dodaj_tankowanie(data_tankowania, paliwo_dodatkowo):
Ta metoda dodaje informacje o tankowaniu do raportu. Sprawdza, czy plik raportu istnieje. Jeśli tak, odczytuje ostatnie polecenie i numer trasy z pliku. Następnie, na podstawie ostatniego polecenia, podejmuje działania:
Jeśli ostatnie polecenie to "Tankowanie" lub "Wyjazd", dodaje nowy wiersz do pliku raportu zawierający informacje o tankowaniu.
W przeciwnym razie, gdy ostatnie polecenie nie jest "Tankowanie" lub "Wyjazd", ustawia atrybut @message na odpowiednią wiadomość o błędzie.
Na koniec zwraca atrybut @message.

Metoda dodaj_powrot(data_zjazdu, km_powrot, paliwo_zjazd):
Ta metoda dodaje informacje o powrocie na bazę do raportu. Sprawdza, czy plik raportu istnieje. Jeśli tak, odczytuje ostatnie polecenie i numer trasy z pliku. Następnie, na podstawie ostatniego polecenia, podejmuje działania:
Jeśli ostatnie polecenie to "Tankowanie" lub "Wyjazd", dodaje nowy wiersz do pliku raportu zawierający informacje o powrocie.
W następnym kroku oblicza normę spalania na podstawie danych z poprzednich wierszy dotyczących wyjazdu, tankowania i powrotu. Na podstawie tych danych oblicza przejechany dystans, zużyte paliwo i normę spalania.
Na koniec, jeśli plik raportu istnieje, dodaje wiersz zawierający normę spalania.
Ustawia również atrybut @message na odpowiednią wiadomość zawierającą informacje o dodanym zjeździe i normie spalania. Na koniec zwraca atrybut @message.

Metoda cala_trasa(data_wyjazdu, km_wyjazd, paliwo_wyjazd, data_tankowania, paliwo_dodatkowo, data_zjazdu, km_powrot, paliwo_zjazd):
Ta metoda dodaje kompletną trasę do raportu, rejestrując wyjazd, tankowanie i zjazd na bazę. Sprawdza, czy plik raportu istnieje i odczytuje ostatnie polecenie oraz numer trasy. Następnie, na podstawie ostatniego polecenia, podejmuje działania:
Jeśli ostatnie polecenie to "Norma" lub plik raportu nie istnieje, wywołuje metody wyjazd, dodaj_tankowanie i dodaj_powrot w celu zarejestrowania poszczególnych etapów trasy.
W przeciwnym razie, gdy ostatnie polecenie nie jest "Norma" (czyli poprzedni przejazd nie został zakończony), ustawia atrybut @message na odpowiednią wiadomość o błędzie.
Na koniec zwraca atrybut @message.
W obu tych metodach dodaj_powrot i cala_trasa wywoływane są inne metody klasy Przejazd, takie jak wyjazd i dodaj_tankowanie, aby zarejestrować odpowiednie etapy trasy i obliczyć normę spalania.
