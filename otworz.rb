require_relative "raporty"

system("clear")

puts "Witaj w obsłudze raportów, będziesz mógł wyświetlić listę wszytkich raportów posegregowaną według daty utworzenia, wpisując nazwę raportu zostaną wświetlone zawarte w nim dane lub wpisz numer rejestracyjny pojazdu aby otrzymać listę zawierającą historię norm spalania paliwa"

puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

raport = Raporty.new

while true
 print "Co chcesz wyświetlić? (LISTA, RAPORT, POJAZD) "
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

 else
  puts "Nieznana komenda, proszę spróbować ponownie."
 end
end