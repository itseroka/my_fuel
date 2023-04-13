require_relative "przejazd_proces"

def cli_zarejestruj_wyjazd
  puts "Podaj numer rejestracyjny pojazdu"
  @numer_pojazdu = gets.chomp.upcase

  puts "Podaj datę wyjazdu"
  @data_wyjazdu = gets.chomp

  puts "Podaj stan licznika"
  @km_wyjazd = gets.chomp.to_f
end

def cli_zarejestruj_dodatnkowanie
  puts "Podaj ilość dotankowanego paliwa"
  @paliwo_dodatkowo = gets.chomp.to_f
end

def cli_zarejestruj_powrot
  puts "Podaj datę zjazdu"
  @data_zjazdu = gets.chomp
 
  puts "Podaj stan licznika po powrocie z trasy"
  @km_powrot = gets.chomp.to_f
    
  puts "Podaj stan paliwa po powrocie z trasy"
  @paliwo_zjazd = gets.chomp.to_f
 end

cli_zarejestruj_wyjazd
cli_zarejestruj_dodatnkowanie
cli_zarejestruj_powrot

 przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @data_wyjazdu, @km_wyjazd, @paliwo_dodatkowo, @data_zjazdu, @km_powrot, @paliwo_zjazd)

puts "1. #{przejazd_proces.numer_pojazdu}"
puts "2. #{przejazd_proces.data_wyjazdu}"
puts "3. #{przejazd_proces.km_wyjazd}"

puts "4. #{przejazd_proces.paliwo_dodatkowo}"

puts "5. #{przejazd_proces.data_zjazdu}"
puts "6. #{przejazd_proces.km_powrot}"
puts "7. #{przejazd_proces.paliwo_zjazd}"
