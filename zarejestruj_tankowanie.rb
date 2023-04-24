require_relative "przejazd_proces"

def cli_zarejestruj_dodatnkowanie
 puts "Podaj ilość dotankowanego paliwa"
 @paliwo_dodatkowo = gets.chomp.to_f
end

cli_zarejestruj_dodatnkowanie

zarejestruj_dodatnkowanie = Przejazd_tankowanie.new(@paliwo_dodatkowo)

puts "Dotankowano: #{zarejestruj_dodatnkowanie.paliwo_dodatkowo}"