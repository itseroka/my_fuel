require_relative "przejazd_proces"
require 'csv'

def pobierz_numer
  puts "Podaj numer rejestracyjny pojazdu"
  @numer_pojazdu = gets.chomp.upcase
  @raport_path = "dynamiczne/progress/#{@numer_pojazdu}.csv"

  if File.exists?(@raport_path)
    CSV.foreach(@raport_path) do |row|
     @numer_trasy_csv = row[1].to_i
     @ostatnie_polecenie = row[0]
    end
 end
 return @numer_pojazdu, @ostatnie_polecenie, @numer_trasy_csv
end

def cli_zarejestruj_wyjazd(numer_pojazdu, numer_trasy_csv)
    @numer_pojazdu = numer_pojazdu
    @numer_trasy_csv = numer_trasy_csv

    @numer_trasy = 1
  
    puts "Podaj datę wyjazdu"
    @data_wyjazdu = gets.chomp
  
    puts "Podaj stan licznika"
    @km_wyjazd = gets.chomp.to_f
  
    puts "Podaj stan paliwa przy wyjeździe w trasę"
    @paliwo_wyjazd = gets.chomp.to_f
    
  end
  

  def cli_zarejestruj_dodatnkowanie(numer_pojazdu, numer_trasy_csv)
    @numer_pojazdu = numer_pojazdu
    @numer_trasy_csv = numer_trasy_csv

    puts "Podaj datę tankowania"
    @data_tankowania = gets.chomp

    puts "Podaj ilość dotankowanego paliwa"
    @paliwo_dodatkowo = gets.chomp.to_f
   end

   def cli_zarejestruj_powrot(numer_pojazdu, numer_trasy_csv)
    @numer_pojazdu = numer_pojazdu
    @numer_trasy_csv = numer_trasy_csv

    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
      
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f
   end

