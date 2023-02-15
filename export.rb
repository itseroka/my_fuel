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

      CSV.open("files/#{@numer_pojazdu}.csv", "w+") do |csv|
        csv << [@numer_pojazdu, @data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, @norma]
      end
      puts "Zapisano raport files/#{@nazwa}.csv"
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
      puts "Podaj nazwe pliku csv do zaimportowania danych (bez rozszerzenia)"
      
      @file = gets.chomp
      
      begin
      CSV.foreach("files/#{@file}.csv", headers: false) do |row|
        puts row
      end
  
      rescue
      puts "Brak pliku"
      end
    end
  
    def pojazd_csv
      header = false
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