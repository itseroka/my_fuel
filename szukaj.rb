# szukaj pojazdu w csv

# [0]Pojazd
# [1]Data wyjazdu
# [2]Data powrotu
# [3]Dotankowane paliwo
# [4]Zużyte paliwo
# [5]Przejechane kilometry
# [6]Norma l/100km

require 'csv'

puts "Podaj nazwe pliku csv do przeszukania danych"
@file = gets.chomp

puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
@szukaj = gets.chomp

CSV.foreach("files/#{@file}.csv") do |row|
    @szukane = row[0]
end


if @szukaj == @szukane
    puts "Znaleziono pojazd #{@szukaj}"
else
    puts "Nie znaleziono pojazdu #{@szukaj}"
end