

# def cli_zarejestruj_wyjazd
#   puts "Podaj numer rejestracyjny pojazdu"
#   @numer_pojazdu = gets.chomp.upcase

#   podaj_numer(@numer_pojazdu)

#   puts "Podaj liczbę porządkową/numer trasy"
#   @numer_trasy = gets.chomp.to_i

#   puts "Podaj datę wyjazdu"
#   @data_wyjazdu = gets.chomp

#   puts "Podaj stan licznika"
#   @km_wyjazd = gets.chomp.to_f

#   puts "Podaj stan paliwa przy wyjeździe w trasę"
#   @paliwo_wyjazd = gets.chomp.to_f

# end

# def podaj_numer(numer_pojazdu)
    
#   @numer_pojazdu = numer_pojazdu
#   @raport_path = "dynamiczne/progress/#{@numer_pojazdu}.csv"

#   CSV.foreach(@raport_path) do |row|
#     @numer_trasy_csv = row[1]
#     @polecenie = row[0]
#   end
  
#   puts "Ostatnio użyty numer porządkowy to: #{@numer_trasy_csv} i polecnie #{@polecenie}"
# end

# def wyjazd

#     CSV.foreach(@raport_path) do |polecenie|
#       @polecenie = polecenie[0]
#     end

#     if File.exists?(@raport_path)
#       puts "plik istnieje"
#       puts "Ostatnie użyte polecenie to: #{@polecenie}"
#       if @polecenie == "Wyjazd"
#         puts "Wyjazd został już zarejestrowany"
#       elsif @polecenie == "Tankowanie"
#         puts "Poprzednia trasa nie została zakończona, sprawdź poprawność polecenia"
#       elsif @polecenie == "Norma"
#         CSV.open(@raport_path, "a+") do |csv|
#           csv << ["Wyjazd", @numer_trasy, @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd]
#         end
#         puts "Wyjazd został zarejestrowany dla: #{@raport_path}"
#       else
#         CSV.open(@raport_path, "w+") do |csv|
#           csv << ["Wyjazd", @numer_trasy, @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd]
#           end
#           puts "Plik został utworzony: #{@raport_path}"
#       end
#     else
#       puts "plik nie istnieje"
#     end
    
#   end

#   cli_zarejestruj_wyjazd
#   wyjazd

puts "Podaj numer rejestracyjny pojazdu"
@numer_pojazdu = gets.chomp.upcase

@raport_path = "dynamiczne/progress/#{@numer_pojazdu}.csv"

if File.exists?(@raport_path)
  puts "Raport istnieje!"

  CSV.foreach(@raport_path) do |row|
   @numer_trasy_csv = row[1]
   @ostatnie_polecenie = row[0]
  end
  puts "Ostatnio użyte polecnie to: #{@polecenie}"

  if @ostatnie_polecenie == "Norma"
      puts "Wykonujemy kod"
  else
      break
  end

 else
        puts "Raport nie istnieje! :("
end