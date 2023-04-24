require_relative "przejazd_proces"

def cli_zarejestruj_wyjazd
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase
  
    puts "Podaj datę wyjazdu"
    @data_wyjazdu = gets.chomp
  
    puts "Podaj stan licznika"
    @km_wyjazd = gets.chomp.to_f
  
    puts "Podaj stan paliwa przy wyjeździe w trasę"
    @paliwo_wyjazd = gets.chomp.to_f
  end

  cli_zarejestruj_wyjazd

  przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd)

  przejazd_proces.wyjazd