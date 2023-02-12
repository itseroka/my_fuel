# kalkulator normy spalania
# uruchom za pomocą komendy $ ruby index.rb

# czyszczenie konsoli
system("clear")

puts "Witaj w kalkulatorze norm spalania, bdziesz poproszony o numer rejestracyjny pojazdu, date wyjazdu, datę powrotu, stan początkowy paliwa, dodatnkowania oraz stan końcowy paliwa żeby obliczyć normę zużycia paliwa l/100 km"

puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

require_relative "przejazd"

trasa = Przejazd.new
trasa.zbierz_dane
trasa.norma_spalania
trasa.zapisz