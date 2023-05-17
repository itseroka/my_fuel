require 'csv'

def podaj_numer
    puts "Numer pojazdu?"
    @numer_pojazdu = gets.chomp.upcase
    @raport_path = "dynamiczne/progress/#{@numer_pojazdu}.csv"

    CSV.foreach(@raport_path) do |row|
      @numer_trasy_csv = row[1]
    end
    
    puts "Ostatnio użyty numer porządkowy to: #{@numer_trasy_csv}"
  end