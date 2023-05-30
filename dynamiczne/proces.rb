require_relative "przejazd_proces"

def pobierz_numer
  puts "Podaj numer rejestracyjny pojazdu"
  @numer_pojazdu = gets.chomp.upcase
  @raport_path = "dynamiczne/progress/#{@numer_pojazdu}.csv"

  if File.exists?(@raport_path)
    CSV.foreach(@raport_path) do |row|
     @numer_trasy_csv = row[1]
     @ostatnie_polecenie = row[0]
    end
 end
end

def cli_zarejestruj_wyjazd
    pobierz_numer

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
    pobierz_numer

    puts "Podaj liczbę porządkową/numer trasy"
    @numer_trasy = gets.chomp.to_i

    puts "Podaj datę tankowania"
    @data_tankowania = gets.chomp

    puts "Podaj ilość dotankowanego paliwa"
    @paliwo_dodatkowo = gets.chomp.to_f
   end

   def cli_zarejestruj_powrot
    pobierz_numer
    
    puts "Podaj liczbę porządkową/numer trasy"
    @numer_trasy = gets.chomp.to_i

    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
      
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f
   end

