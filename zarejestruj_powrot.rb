require_relative "przejazd_proces"

def cli_zarejestruj_powrot
    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
      
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f
   end

   cli_zarejestruj_powrot

   zarejestruj_powrot = Przejazd_zjazd.new(@data_zjazdu, @km_powrot, @paliwo_zjazd)

   puts "Dane do zapisania zjazdu #{zarejestruj_powrot.data_zjazdu}, #{zarejestruj_powrot.km_powrot}, #{zarejestruj_powrot.paliwo_zjazd}"