require_relative "przejazd_proces"

def cli_zarejestruj_powrot
    puts "Podaj numer pojazdu"
    @numer_pojazdu = gets.chomp.upcase
end

cli_zarejestruj_powrot

norma = Norma.new(@numer_pojazdu)

puts norma.wyswietl