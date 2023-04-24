require_relative "przejazd_proces"







cli_zarejestruj_wyjazd
cli_zarejestruj_dodatnkowanie
cli_zarejestruj_powrot

 przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd, @paliwo_dodatkowo, @data_zjazdu, @km_powrot, @paliwo_zjazd)

puts "1. #{przejazd_proces.numer_pojazdu}"
puts "2. #{przejazd_proces.data_wyjazdu}"
puts "3. #{przejazd_proces.km_wyjazd}"

puts "4. #{przejazd_proces.paliwo_dodatkowo}"

puts "5. #{przejazd_proces.data_zjazdu}"
puts "6. #{przejazd_proces.km_powrot}"
puts "7. #{przejazd_proces.paliwo_zjazd}"

przejazd_proces.wyjazd

