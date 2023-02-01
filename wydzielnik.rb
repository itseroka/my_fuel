# wydzielnik samej normy

# [0]Pojazd
# [1]Data wyjazdu
# [2]Data powrotu
# [3]Dotankowane paliwo
# [4]Zużyte paliwo
# [5]Przejechane kilometry
# [6]Norma l/100km

require 'csv'

puts "Podaj nazwe pliku csv do zaimportowania danych"
@file = gets.chomp

CSV.foreach("files/#{@file}.csv") do |row|
 puts row.inspect
 @wydzielnik = ""
 @wydzielnik = row[6].to_s
 @obliczenie = (row[4].to_f/row[5].to_f)*100
end

puts "Wyświetl normę - #{@wydzielnik} - #{@obliczenie}"