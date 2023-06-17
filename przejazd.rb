require 'csv'

class Przejazd
  def initialize(numer_pojazdu)
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
  
      if ostatnie_polecenie == "Norma" || !File.exists?(@raport_path)
        CSV.open(@raport_path, "a+") do |csv|
          csv << ["Wyjazd", numer_trasy_csv, data_wyjazdu, km_wyjazd, paliwo_wyjazd]
        end
        # puts "Wyjazd został zarejestrowany dla: #{@raport_path}"
      elsif ostatnie_polecenie == "Wyjazd" || ostatnie_polecenie == "Tankowanie" 
        # puts "Błąd: Nie można wykonać kolejnego wyjazdu."
      else
        CSV.open(@raport_path, "w+") do |csv|
          csv << ["Wyjazd", 1, data_wyjazdu, km_wyjazd, paliwo_wyjazd]
        end
        # puts "Plik został utworzony: #{@raport_path}"
      end
    end

def dodaj_tankowanie(data_tankowania, paliwo_dodatkowo)

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
        #   puts "Tankowanie zostało dodane dla raportu: #{@raport_path}"
          else
        #    puts "Brak raportu - sprawdź poprawność numeru rejestracyjnego"
        end
       end
end


def dodaj_powrot(data_zjazdu, km_powrot, paliwo_zjazd)

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
        #   puts "Zjazd został dodane dla raportu: #{@raport_path}"
          else
        #   puts "Brak raportu - sprawdź poprawność numeru rejestracyjnego"
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
            norma_spalania = zuzyte_paliwo / przejechany_dystans * 100
          end
        end
             
        # puts "Twoje spalanie z trasy to #{norma_spalania}"
             
         if File.exists?(@raport_path)
           CSV.open(@raport_path, "a+") do |csv|
             csv << ["Norma", numer_trasy_csv, data_normy, norma_spalania]
           end
         end
        end
end

  end
  