# szukaj pojazdu w csv

# [0]Pojazd
# [1]Data wyjazdu
# [2]Data powrotu
# [3]Dotankowane paliwo
# [4]Zużyte paliwo
# [5]Przejechane kilometry
# [6]Norma l/100km

require 'csv'

puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
@szukaj = gets.chomp

Dir.glob("files/*.csv") do |file|
  CSV.foreach(file) do |row|
    @szukane = row[0]
    @zjazd = row[2]
    @wydzielnik = row[6].to_s
    @obliczenie = (row[4].to_f/row[5].to_f)*100
  end

 if @szukaj == @szukane
  puts "Wyświetl normę z #{@zjazd} - #{@obliczenie}"
 else
  puts "Nie znaleziono pojazdu #{@szukaj}"
 end
end

if @szukaj == @szukane
    puts "Wyświetlono raporty pojazdu #{@szukaj}"
end