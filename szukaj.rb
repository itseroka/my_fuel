require 'csv'

puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
@szukaj = gets.chomp.upcase

raport_path = "files/#{@szukaj}.csv"

if File.exist?(raport_path)
  puts "Dane z pliku #{raport_path}:"
  CSV.foreach(raport_path) do |row|
    puts "#{row[1]}, #{row[5]}"
  end
else
  puts "Plik #{raport_path} nie istnieje."
end