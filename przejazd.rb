require 'csv'

class Przejazd
  attr_reader :message, :message_norma

  def initialize(numer_pojazdu)
    @numer_pojazdu = numer_pojazdu
    @raport_path = "./data/#{numer_pojazdu}.csv"
    if File.exists?(@raport_path)
      CSV.foreach(@raport_path) do |row|
       numer_trasy_csv = row[1].to_i
       ostatnie_polecenie = row[0]
      end
   end
  end

    def wyjazd(data_wyjazdu, km_wyjazd, paliwo_wyjazd)

      if File.exists?(@raport_path)
        ostatnie_polecenie = nil
        numer_trasy_csv = nil
        CSV.foreach(@raport_path) do |row|
          numer_trasy_csv = row[1].to_i + 1
          ostatnie_polecenie = row[0]
        end
      end
  
      if ostatnie_polecenie == "Norma"
        CSV.open(@raport_path, "a+") do |csv|
          csv << ["Wyjazd", numer_trasy_csv, data_wyjazdu, km_wyjazd, paliwo_wyjazd, ostatnie_polecenie]
        end
        @message = "Wyjazd został zarejestrowany dla: #{@numer_pojazdu}"
      elsif ostatnie_polecenie == "Wyjazd" || ostatnie_polecenie == "Tankowanie" 
        @message = "Nie zakończono ostatniego przejazdu dla: #{@numer_pojazdu}"
      else
        CSV.open(@raport_path, "w+") do |csv|
          csv << ["Wyjazd", 1, data_wyjazdu, km_wyjazd, paliwo_wyjazd]
        end
        @message = "Zarejestrowano pierwszy wyjazd dla: #{@numer_pojazdu}"
      end
    end

def dodaj_tankowanie(data_tankowania, paliwo_dodatkowo)

  @message = "Brak raportu lub przejazd nie został rozpoczęty - sprawdź poprawność dla: #{@numer_pojazdu}"
  
    if File.exists?(@raport_path)
        ostatnie_polecenie = nil
        numer_trasy_csv = nil
        CSV.foreach(@raport_path) do |row|
         numer_trasy_csv = row[1].to_i
         ostatnie_polecenie = row[0]
        end
     end

    if ostatnie_polecenie == "Tankowanie" || ostatnie_polecenie == "Wyjazd"
        if File.exists?(@raport_path)
          CSV.open(@raport_path, "a+") do |csv|
            csv << ["Tankowanie", numer_trasy_csv, data_tankowania, paliwo_dodatkowo]
          end
          @message = "Tankowanie zostało dodane dla pojazdu: #{@numer_pojazdu}"
        end
       end
end


  def dodaj_powrot(data_zjazdu, km_powrot, paliwo_zjazd)

    @message = "Brak raportu lub trasa nie została rozpoczęta  - sprawdź poprawność dla: #{@numer_pojazdu}"

    if File.exists?(@raport_path)
        ostatnie_polecenie = nil
        numer_trasy_csv = nil
        CSV.foreach(@raport_path) do |row|
         numer_trasy_csv = row[1].to_i
         ostatnie_polecenie = row[0]
        end
     end

    if ostatnie_polecenie == "Tankowanie" || ostatnie_polecenie == "Wyjazd"
        if File.exists?(@raport_path)
          CSV.open(@raport_path, "a+") do |csv|
            csv << ["Powrót", numer_trasy_csv, data_zjazdu, km_powrot, paliwo_zjazd]
          end
        end
           
        stan_licznika = 0.0
        stan_poczatkowy_paliwa = 0
        ilosc_paliwa = []
        stan_koncowy_paliwa = 0
        norma_spalania = 0
        data_normy = nil
        
        CSV.foreach(@raport_path) do |row|
          if row[0] == "Wyjazd" && row[1] == "#{numer_trasy_csv}"
            stan_licznika = row[3].to_f
            stan_poczatkowy_paliwa = row[4].to_f
          elsif row[0] == "Tankowanie" && row[1] == "#{numer_trasy_csv}"
            ilosc_paliwa << row[3].to_f
          elsif row[0] == "Powrót" && row[1] == "#{numer_trasy_csv}"
            data_normy = row[2]
            przejechany_dystans = row[3].to_f - stan_licznika
            stan_koncowy_paliwa = row[4].to_f
            zuzyte_paliwo = stan_poczatkowy_paliwa + ilosc_paliwa.sum - stan_koncowy_paliwa
            @norma_spalania = zuzyte_paliwo / przejechany_dystans * 100
          end
        end
             
         if File.exists?(@raport_path)
           CSV.open(@raport_path, "a+") do |csv|
             csv << ["Norma", numer_trasy_csv, data_normy, @norma_spalania]
           end
         end
        end

        @message = "Zjazd na bazę został dodany dla: #{@numer_pojazdu} - twoje spalanie z trasy to #{@norma_spalania}"
  end

  def cala_trasa(data_wyjazdu, km_wyjazd, paliwo_wyjazd, data_tankowania, paliwo_dodatkowo, data_zjazdu, km_powrot, paliwo_zjazd)

    if File.exists?(@raport_path)
      ostatnie_polecenie = nil
      numer_trasy_csv = nil
      CSV.foreach(@raport_path) do |row|
        numer_trasy_csv = row[1].to_i + 1
        ostatnie_polecenie = row[0]
      end
    end

    if ostatnie_polecenie == "Norma" || !File.exists?(@raport_path)
      wyjazd(data_wyjazdu, km_wyjazd, paliwo_wyjazd)
      dodaj_tankowanie(data_tankowania, paliwo_dodatkowo)
      dodaj_powrot(data_zjazdu, km_powrot, paliwo_zjazd)
      @message = "Przejazd został dodany dla: #{@numer_pojazdu} - twoje spalanie z trasy to #{@norma_spalania}"
    else 
      @message = "Nie zakończono ostatniego przejazdu dla: #{@numer_pojazdu}"
    end
  end

end
  