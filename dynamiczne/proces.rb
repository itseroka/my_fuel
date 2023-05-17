require_relative "przejazd_proces"

def cli_zarejestruj_wyjazd
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase

    podaj_numer(@numer_pojazdu)

    puts "Podaj liczbę porządkową/numer trasy"
    @numer_trasy = gets.chomp.to_i
  
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

    podaj_numer(@numer_pojazdu)

    puts "Podaj liczbę porządkową/numer trasy"
    @numer_trasy = gets.chomp.to_i

    puts "Podaj datę tankowania"
    @data_tankowania = gets.chomp

    puts "Podaj ilość dotankowanego paliwa"
    @paliwo_dodatkowo = gets.chomp.to_f
   end

   def cli_zarejestruj_powrot
    puts "Podaj numer pojazdu"
    @numer_pojazdu = gets.chomp.upcase

    podaj_numer(@numer_pojazdu)
    
    puts "Podaj liczbę porządkową/numer trasy"
    @numer_trasy = gets.chomp.to_i

    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
      
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f
   end
  
   def podaj_numer(numer_pojazdu)
    @numer_pojazdu = numer_pojazdu
    @raport_path = "dynamiczne/progress/#{@numer_pojazdu}.csv"
   if File.exists?(@raport_path)
   CSV.foreach(@raport_path) do |row|
     @numer_trasy_csv = row[1]
   end
   puts "Ostatnio użyty numer porządkowy to: #{@numer_trasy_csv}"
  else
   puts "Tworzę nowy raport dla pojazdu #{@numer_trasy_csv}"
  end
 end