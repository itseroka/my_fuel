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
    attr_accessor :data_zjazdu, :km_powrot, :paliwo_zjazd
    def initialize(data_zjazdu, km_powrot, paliwo_zjazd)
      @data_zjazdu = data_zjazdu
      @km_powrot = km_powrot
      @paliwo_zjazd = paliwo_zjazd
    end
  end