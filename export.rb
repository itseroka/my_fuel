require 'csv'

class Przejazd
  attr_accessor :numer_pojazdu, :data_wyjazdu, :data_zjazdu, :km_wyjazd, :km_powrot, :paliwo_wyjazd, :paliwo_dodatkowo, :paliwo_zjazd, :zuzycie, :przejechane_kilometry, :norma

    def zbierz_dane
    puts "Podaj numer rejestracyjny pojazdu"
    @numer_pojazdu = gets.chomp.upcase
   
    puts "Podaj datę wyjazdu"
    @data_wyjazdu = gets.chomp
   
    puts "Podaj datę zjazdu"
    @data_zjazdu = gets.chomp
   
    puts "Podaj stan licznika podczas wyjazdu w trasę"
    @km_wyjazd = gets.chomp.to_f
   
    puts "Podaj stan licznika po powrocie z trasy"
    @km_powrot = gets.chomp.to_f
   
    puts "Podaj stan paliwa przy wyjeździe w trasę"
    @paliwo_wyjazd = gets.chomp.to_f
   
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
   
    puts "Podaj stan paliwa po powrocie z trasy"
    @paliwo_zjazd = gets.chomp.to_f
    end
   
    def norma_spalania
    @zuzycie = @paliwo_wyjazd + @paliwo_dodatkowo - @paliwo_zjazd
    @przejechane_kilometry = @km_powrot - @km_wyjazd
    @norma = (@zuzycie/@przejechane_kilometry)*100
    puts "Twoja norma to #{@norma}"
    end

def zapisz
 if File.exists?("files/#{@numer_pojazdu}.csv")
   CSV.open("files/#{@numer_pojazdu}.csv", "a+") do |csv|
    csv << [@data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, @norma]
   end
  else
   CSV.open("files/#{@numer_pojazdu}.csv", "w+") do |csv|
    csv << ["Data wyjazdu", "Data powrotu", "Dotankowane paliwo", "Zużyte paliwo", "Przejechane kilometry", "Norma l/100km"]
    csv << [@data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, @norma]
   end
  end
 puts "Zapisano raport files/#{@numer_pojazdu}.csv"
end
  
   end

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
      
      @file = gets.chomp
      
      begin
      CSV.foreach("files/#{@file}.csv", headers: true) do |row|
        puts row
      end
  
      rescue
      puts "Brak pliku"
      end
    end
  
    def pojazd_csv
     puts "Podaj numer rejestracyjny pojazdu do przeszukania raportu"
     @szukaj = gets.chomp.upcase
      
      raport_path = "files/#{@szukaj}.csv"
      
      if File.exist?(raport_path)
        puts "Dane dla pojazdu: #{@szukaj}:"
        CSV.foreach(raport_path) do |row|
          puts "#{row[1]}, #{row[5]}"
        end
      else
        puts "Plik #{raport_path} nie istnieje."
      end
     
    end
     
  end