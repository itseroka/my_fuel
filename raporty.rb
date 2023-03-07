require 'csv'

class Raporty
    def wyswietl_liste
     Dir.entries("files/").sort_by do |entry|
      File.ctime("files//#{entry}")
      end.reject { |entry| ['.', '..', '.DS_Store'].include?(entry) }.each do |entry|
       puts entry
    end
   end
     
    def wyswietl_raport
   
     puts "Podaj nazwe pliku csv aby wyświetlić dane (bez rozszerzenia)"
     @szukaj = gets.chomp.upcase
     @raport_path = "files/#{@szukaj}.csv"
   
     begin
      CSV.foreach(@raport_path, headers: true) do |row|
      puts row
     end
     
     rescue
      puts "Brak pliku"
     end
    end
     
    def pojazd_csv
     puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
     @szukaj = gets.chomp.upcase
         
     @raport_path = "files/#{@szukaj}.csv"
     
     if File.exist?(@raport_path)
      puts "Dane dla pojazdu: #{@szukaj}:"
      CSV.foreach(@raport_path) do |row|
      puts "#{row[1]}, #{row[5]}"
      end
      else
      puts "Plik #{@raport_path} nie istnieje."
      end
     end
   end