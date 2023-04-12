require_relative "przejazd_proces"

# def cli_zarejestruj_wyjazd
#  puts "Podaj numer rejestracyjny pojazdu"
#  @numer_pojazdu = gets.chomp.upcase
   
#  puts "Podaj datę wyjazdu"
#  @data_wyjazdu = gets.chomp
   
#  puts "Podaj stan licznika podczas wyjazdu w trasę"
#  @km_wyjazd = gets.chomp.to_f
# end
   
# def cli_zarejestruj_dodatnkowanie
#  puts "Czy podczas wyjazdu było dotankowywane paliwo? Podaj: TAK/NIE"
#  @paliwo_dodatkowo = 0
#   until @tankowania_w_trasie == "NIE"
#   @tankowania_w_trasie = gets.chomp.upcase
#    if @tankowania_w_trasie == "TAK"
#    puts "Podaj wartość zatankowanego paliwa"
#    @paliwo_dodatkowo = @paliwo_dodatkowo + gets.chomp.to_f
#    puts "Czy było kolejne tankowanie? Podaj: TAK/NIE"
#    end
#   end
# end
   
# def cli_zarejestruj_powrot
#  puts "Podaj datę zjazdu"
#  @data_zjazdu = gets.chomp

#  puts "Podaj stan licznika po powrocie z trasy"
#  @km_powrot = gets.chomp.to_f
   
#  puts "Podaj stan paliwa po powrocie z trasy"
#  @paliwo_zjazd = gets.chomp.to_f
# end
   
# #    def wypisz_norme
# #     #    norma z csv
# #    end

#    cli_zarejestruj_wyjazd
# #    cli_zarejestruj_dodatnkowanie
# #    cli_zarejestruj_powrot

#    przejazd_proces = Przejazd_proces.new(@numer_pojazdu)

#    puts przejazd_proces.numer_pojazdu


def cli_zarejestruj_wyjazd
  puts "Podaj numer rejestracyjny pojazdu"
  @numer_pojazdu = gets.chomp.upcase

  puts "Podaj datę wyjazdu"
  @data_wyjazdu = gets.chomp

  puts "Podaj stan licznika"
  @km_wyjazd = gets.chomp.to_f
end

cli_zarejestruj_wyjazd

przejazd_proces = Przejazd_proces.new(@numer_pojazdu, @data_wyjazdu, @km_wyjazd)

puts "1. #{przejazd_proces.numer_pojazdu}"
puts "2. #{przejazd_proces.data_wyjazdu}"
puts "3. #{przejazd_proces.km_wyjazd}"

