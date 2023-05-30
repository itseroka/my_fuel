require_relative 'dynamiczne/proces'
require_relative 'dynamiczne/przejazd_proces'

puts "Wpisz polecenie aby zacząć - WYJAZD, TANKOWANIE, ZJAZD"
input = gets.chomp.upcase

case input
when "WYJAZD"
    pobierz_numer
    if @ostatnie_polecenie == "Norma" || !File.exists?(@raport_path)
     cli_zarejestruj_wyjazd(@numer_pojazdu)
     przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @numer_trasy)
     przejazd_proces.wyjazd(@data_wyjazdu, @km_wyjazd, @paliwo_wyjazd)
    else
        puts "Nie można wykonać"
    end
    

when "TANKOWANIE"
    pobierz_numer
    cli_zarejestruj_dodatnkowanie(@numer_pojazdu)
    przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @numer_trasy)
    przejazd_proces.dodaj_tankowanie(@data_tankowania, @paliwo_dodatkowo)

when "ZJAZD"
    pobierz_numer
    cli_zarejestruj_powrot(@numer_pojazdu)
    przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @numer_trasy)
    przejazd_proces.dodaj_powrot(@data_zjazdu, @km_powrot, @paliwo_zjazd)
else
    puts "Nieznana komenda, proszę spróbować ponownie."
end