require_relative "przejazd_proces"

def cli_zarejestruj_powrot
    puts "Podaj numer pojazdu"
    @numer_pojazdu = gets.chomp.upcase

    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
      
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f
   end

   cli_zarejestruj_powrot

   zarejestruj_powrot = Przejazd_zjazd.new(@numer_pojazdu, @data_zjazdu, @km_powrot, @paliwo_zjazd)

   zarejestruj_powrot.dodaj_powrot