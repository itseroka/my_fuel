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
    puts "Podaj nazwe pliku csv do zaimportowania danych"
    
    @file = gets.chomp
    
    CSV.foreach("files/#{@file}.csv", headers: true) do |row|
      puts row
    end
    
  end

  def pojazd_csv
    header = true
    found_data = false
   
    puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
    @szukaj = gets.chomp
   
    Dir.glob("files/*.csv") do |file|
      CSV.foreach(file) do |row|
       if header
         header = false
         next
       end
   
       @pojazd_z_raportu = row[0]
       @data_zjazdu = row[2]
       @norma = row[6]
   
       if @pojazd_z_raportu == @szukaj
         found_data = true
         puts "Norma pojazdu #{@szukaj} z dnia #{@data_zjazdu} to #{@norma}"
       end
     end
     header = true
    end
   
    if !found_data
     puts "Brak pojazdu"
    end
   
  end
end


