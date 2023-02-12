require_relative "raporty"

system("clear")

puts "Witaj w obsłudze raportów, będziesz mógł wyświetlić listę wszytkich raportów posegregowaną według daty utworzenia, wpisując nazwę raportu zostaną wświetlone zawarte w nim dane lub wpisz numer rejestracyjny pojazdu aby otrzymać listę zawierającą historię norm spalania paliwa"

puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

raport = Raporty.new

raport.wyswietl_liste
raport.wyswietl_raport
raport.pojazd_csv