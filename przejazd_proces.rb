require 'csv'

class Przejazd_start
    attr_accessor :numer_pojazdu, :data_wyjazdu, :km_wyjazd, :paliwo_dodatkowoot
    def initialize(numer_pojazdu, data_wyjazdu, km_wyjazd, paliwo_wyjazd)
      @numer_pojazdu = numer_pojazdu
      @data_wyjazdu = data_wyjazdu
      @km_wyjazd = km_wyjazd
      @paliwo_wyjazd = paliwo_wyjazd
    end

    def wyjazd
      @raport_path = "progress/#{@numer_pojazdu}.csv"

      if File.exists?(@raport_path)
      CSV.open(@raport_path, "a+") do |csv|
        csv << ["Wyjazd", @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd]
      end
      puts "Wyjazd został zarejestrowany dla: #{@raport_path}"
      else
       CSV.open(@raport_path, "w+") do |csv|
        csv << ["Wyjazd", @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd]
        end
        puts "Plik został utworzony: #{@raport_path}"
      end
    end
end
  
  class Przejazd_tankowanie
    attr_accessor :numer_pojazdu, :data_tankowania, :paliwo_dodatkowo
    def initialize(numer_pojazdu, data_tankowania, paliwo_dodatkowo)
     @numer_pojazdu = numer_pojazdu
     @data_tankowania = data_tankowania
     @paliwo_dodatkowo = paliwo_dodatkowo
    end

   def dodaj_tankowanie
    @raport_path = "progress/#{@numer_pojazdu}.csv"
      
    if File.exists?(@raport_path)
      CSV.open(@raport_path, "a+") do |csv|
        csv << ["Tankowanie", @data_tankowania, @paliwo_dodatkowo]
      end
      puts "Tankowanie zostało dodane dla raportu: #{@raport_path}"
      else
       puts "Brak raportu - sprawdź poprawność numeru rejestracyjnego"
      end
   end

  end

  class Przejazd_zjazd
    attr_accessor :numer_pojazdu, :data_zjazdu, :km_powrot, :paliwo_zjazd
    def initialize(numer_pojazdu, data_zjazdu, km_powrot, paliwo_zjazd)
      @numer_pojazdu = numer_pojazdu
      @data_zjazdu = data_zjazdu
      @km_powrot = km_powrot
      @paliwo_zjazd = paliwo_zjazd
    end

    def dodaj_powrot
      @raport_path = "progress/#{@numer_pojazdu}.csv"

      if File.exists?(@raport_path)
        CSV.open(@raport_path, "a+") do |csv|
          csv << ["Powrót", @data_zjazdu, @km_powrot, @paliwo_zjazd]
        end
        puts "Zjazd został dodane dla raportu: #{@raport_path}"
        else
         puts "Brak raportu - sprawdź poprawność numeru rejestracyjnego"
        end
    end
    
  end

  class Norma
    attr_accessor :numer_pojazdu
    def initialize(numer_pojazdu)
      @numer_pojazdu = numer_pojazdu
    end

    def wyswietl
      @raport_path = "progress/#{@numer_pojazdu}.csv"

      CSV.foreach(@raport_path, headers: true) do |row|
        puts row
      end

    end

  end