# Znajdz w pliku czy jest pojazd
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