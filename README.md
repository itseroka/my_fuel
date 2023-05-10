Witaj w kalkulatorze norm spalania, będziesz poproszony o numer rejestracyjny pojazdu, date wyjazdu, datę powrotu, stan początkowy paliwa, dodatnkowania oraz stan końcowy paliwa żeby obliczyć normę zużycia paliwa l/100 km.

_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

Plik start.rb jest odpowiedzialny za statyczne zbieranie danych (posiadając wszystkie dane) do pracy nad zapisem i odczytem raportu z historią przejazdu pojazdu.

- po uruchomieniu polecenia "LICZ" zapiszesz przejazd do pliku CSV
- po uruchomieniu polecenia LISTA możesz wyświetlić listę zapisanych raportów
- po uruchomieniu polecenia RAPORT możesz wpisać numer pojazdu aby wyświetlić wszystkie raporty dotyczące konkretnego przypadku.

_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

Plik start_proces.rb jest odpowiedziany za dynamiczne zbieranie danych - przejazd jest rozłożony w czasie, na poszczególne etapy.

- po uruchomieniu polecenia "WYJAZD" zapiszesz te dane które dotyczą zaczęcia trasy
- po uruchomieniu polecenia "TANKOWANIE" zapiszesz datę i ilość zatankowanego paliwa
- po uruchomieniu polecenia "ZJAZD" zapiszesz te dane, które dotyczą zjazdu na bazę oraz zostanie obliczona norma.

_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-