require 'csv'

puts "Podaj nazwe pliku csv do zaimportowania danych"

@file = gets.chomp

CSV.foreach("#{@file}.csv", headers: true) do |row|
  puts row
end