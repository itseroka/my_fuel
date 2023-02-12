# szukaj pojazdu w csv
# [0]Pojazd
# [1]Data wyjazdu
# [2]Data powrotu
# [3]Dotankowane paliwo
# [4]Zużyte paliwo
# [5]Przejechane kilometry
# [6]Norma l/100km

require 'csv'
header = true
found_data = false

puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
@szukaj = gets.chomp

Dir.glob("files/*.csv") do |file|
  CSV.foreach(file) do |row|
    if header
      header = false
      next
    end

    @pojazd_z_raportu = row[0]
    @norma = row[6]

    if @pojazd_z_raportu == @szukaj
      found_data = true
      puts "Norma pojazdu #{@szukaj} to #{@norma}"
    end
  end
  header = true
end

if !found_data
  puts "Brak pojazdu"
  end