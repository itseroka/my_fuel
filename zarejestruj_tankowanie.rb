require_relative "przejazd_proces"

def cli_zarejestruj_dodatnkowanie
 puts "Podaj numer pojazdu"
 @numer_pojazdu = gets.chomp.upcase
 puts "Podaj datę tankowania"
 @data_tankowania = gets.chomp
 puts "Podaj ilość dotankowanego paliwa"
 @paliwo_dodatkowo = gets.chomp.to_f
end

cli_zarejestruj_dodatnkowanie

zarejestruj_dodatnkowanie = Przejazd_tankowanie.new(@numer_pojazdu, @data_tankowania, @paliwo_dodatkowo)

zarejestruj_dodatnkowanie.dodaj_tankowanie