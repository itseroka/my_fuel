require_relative "statyczne/przejazd"
require_relative "statyczne/raporty"
require_relative 'statyczne/cli'


system("clear")

puts "Witaj w kalkulatorze norm spalania, będziesz poproszony o numer rejestracyjny pojazdu, date wyjazdu, datę powrotu, stan początkowy paliwa, dodatnkowania oraz stan końcowy paliwa żeby obliczyć normę zużycia paliwa l/100 km - polecenie LICZ, możesz wyświetlić listę zapisanych raportów - polecenie LISTA, możesz wyświetlić listę oraz podać nazwę pliku aby wyświetlić dane - polecenie RAPORT, możesz wpisać numer pojazdu aby wyświetlić wszystkie raporty dotyczące konkretnego przypadku - polecenie POJAZD"

puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

raport = Raporty.new

puts "Wpisz polecenie aby zacząć - LICZ, LISTA, RAPORT, POJAZD"
input = gets.chomp.upcase

case input
when "LISTA"
    raport.wyswietl_liste

when "RAPORT"
    raport.wyswietl_liste
    raport.wyswietl_raport

when "POJAZD"
    raport.pojazd_csv

when "LICZ"
    cli_zbierz_dane
else
    puts "Nieznana komenda, proszę spróbować ponownie."
end
