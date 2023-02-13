require_relative "export"

system("clear")

puts "Witaj w kalkulatorze norm spalania, będziesz poproszony o numer rejestracyjny pojazdu, date wyjazdu, datę powrotu, stan początkowy paliwa, dodatnkowania oraz stan końcowy paliwa żeby obliczyć normę zużycia paliwa l/100 km - polecenie LICZ, możesz wyświetlić listę zapisanych raportów - polecenie LISTA, możesz wyświetlić listę oraz podać nazwę pliku aby wyświetlić dane - polecenie RAPORT, możesz wpisać numer pojazdu aby wyświetlić wszystkie raporty dotyczące konkretnego przypadku - polecenie POJAZD"

puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

raport = Raporty.new
trasa = Przejazd.new

while true
 puts "Wpisz polecenie aby zacząć - LICZ, LISTA, RAPORT, POJAZD"
 input = gets.chomp.upcase

 if input == "LISTA"
  raport.wyswietl_liste
 break

 elsif input == "RAPORT"
  raport.wyswietl_liste
  raport.wyswietl_raport
 break

 elsif input == "POJAZD"
  raport.pojazd_csv
 break

 elsif input == "LICZ"

  trasa.zbierz_dane
  trasa.norma_spalania
  trasa.zapisz
 break

 else
  puts "Nieznana komenda, proszę spróbować ponownie."
 end
end