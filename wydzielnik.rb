# wydzielnik samej normy

require 'csv'

puts "Podaj nazwe pliku csv do zaimportowania danych"
@file = gets.chomp

CSV.foreach("files/#{@file}.csv") do |row|
 puts row.inspect
 @wydzielnik = ""
 @wydzielnik = row[5].to_s
end

puts "Wyświetl normę - #{@wydzielnik}"