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

      stan_licznika = 0.0
      stan_poczatkowy_paliwa = 0
      ilosc_paliwa = []
      stan_koncowy_paliwa = 0
      norma_spalania = 0
      data_normy = nil

      CSV.foreach(@raport_path) do |row|
        case row[0]
        when "Wyjazd"
          stan_licznika = row[2].to_f
          stan_poczatkowy_paliwa = row[3].to_f
        when "Tankowanie"
          ilosc_paliwa << row[2].to_f
        when "Powrót"
          data_normy = row[1]
          przejechany_dystans = row[2].to_f - stan_licznika
          stan_koncowy_paliwa = row[3].to_f
          zuzyte_paliwo = stan_poczatkowy_paliwa + ilosc_paliwa.sum - stan_koncowy_paliwa
          norma_spalania = zuzyte_paliwo / przejechany_dystans * 100
        end
      end
      puts "Twoje spalanie z trasy to #{norma_spalania}"
      if File.exists?(@raport_path)
        CSV.open(@raport_path, "a+") do |csv|
          csv << ["Norma", data_normy, norma_spalania]
        end
      end
    end

  end
  