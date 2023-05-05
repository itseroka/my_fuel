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

  def cli_zarejestruj_dodatnkowanie
    puts "Podaj numer pojazdu"
    @numer_pojazdu = gets.chomp.upcase
    puts "Podaj datę tankowania"
    @data_tankowania = gets.chomp
    puts "Podaj ilość dotankowanego paliwa"
    @paliwo_dodatkowo = gets.chomp.to_f
   end

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

  cli_zarejestruj_wyjazd
  cli_zarejestruj_dodatnkowanie
  cli_zarejestruj_powrot

  przejazd_proces = Przejazd_proces.new(@numer_pojazdu)

  przejazd_proces.wyjazd(@data_wyjazdu, @km_wyjazd, @paliwo_wyjazd)
  przejazd_proces.dodaj_tankowanie(@data_tankowania, @paliwo_dodatkowo)
  przejazd_proces.dodaj_powrot(@data_zjazdu, @km_powrot, @paliwo_zjazd)

  