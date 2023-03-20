def cli_zarejestruj_wyjazd
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase
   
    puts "Podaj datę wyjazdu"
    @data_wyjazdu = gets.chomp
   
    puts "Podaj stan licznika podczas wyjazdu w trasę"
    @km_wyjazd = gets.chomp.to_f
   end
   
   def cli_zarejestruj_dodatnkowanie
       puts "Czy podczas wyjazdu było dotankowywane paliwo? Podaj: TAK/NIE"
     @paliwo_dodatkowo = 0
      until @tankowania_w_trasie == "NIE"
       @tankowania_w_trasie = gets.chomp.upcase
        if @tankowania_w_trasie == "TAK"
         puts "Podaj wartość zatankowanego paliwa"
         @paliwo_dodatkowo = @paliwo_dodatkowo + gets.chomp.to_f
         puts "Czy było kolejne tankowanie? Podaj: TAK/NIE"
        end
   end
   
   def cli_zarejestruj_powrot
       puts "Podaj datę zjazdu"
       @data_zjazdu = gets.chomp
   
       puts "Podaj stan licznika po powrocie z trasy"
       @km_powrot = gets.chomp.to_f
   
       puts "Podaj stan paliwa po powrocie z trasy"
       @paliwo_zjazd = gets.chomp.to_f
   end
   
   def wypisz_norme
    #    norma z csv
   end