require_relative 'dynamiczne/przejazd_proces'

system("clear")

puts "Wpisz polecenie aby zacząć - WYJAZD, TANKOWANIE, ZJAZD"
input = gets.chomp.upcase

case input
when "WYJAZD"
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase

    puts "Podaj datę wyjazdu"
    @data_wyjazdu = gets.chomp
  
    puts "Podaj stan licznika"
    @km_wyjazd = gets.chomp.to_f
  
    puts "Podaj stan paliwa przy wyjeździe w trasę"
    @paliwo_wyjazd = gets.chomp.to_f

     przejazd = Przejazd.new(@numer_pojazdu)
     przejazd.wyjazd(@data_wyjazdu, @km_wyjazd, @paliwo_wyjazd)

when "TANKOWANIE"
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase

    puts "Podaj datę tankowania"
    @data_tankowania = gets.chomp

    puts "Podaj ilość dotankowanego paliwa"
    @paliwo_dodatkowo = gets.chomp.to_f

    przejazd = Przejazd.new(@numer_pojazdu)
    przejazd.dodaj_tankowanie(@data_tankowania, @paliwo_dodatkowo)

when "ZJAZD"
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase

    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
      
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f

    przejazd = Przejazd.new(@numer_pojazdu)
    przejazd.dodaj_powrot(@data_zjazdu, @km_powrot, @paliwo_zjazd)
end