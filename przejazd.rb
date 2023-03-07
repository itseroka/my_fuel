require 'csv'

class Przejazd

 def initialize(numer_pojazdu, data_wyjazdu, data_zjazdu, km_wyjazd, km_powrot, paliwo_wyjazd, paliwo_dodatkowo, paliwo_zjazd, zuzycie, przejechane_kilometry)

  @numer_pojazdu = numer_pojazdu
  @data_wyjazdu = data_wyjazdu
  @data_zjazdu = data_zjazdu
  @km_wyjazd = km_wyjazd
  @km_powrot = km_powrot
  @paliwo_wyjazd = paliwo_wyjazd
  @paliwo_dodatkowo = paliwo_dodatkowo
  @paliwo_zjazd = paliwo_zjazd
  @zuzycie = zuzycie
  @przejechane_kilometry = przejechane_kilometry
 end

 def norma_spalania
  @zuzycie = @paliwo_wyjazd + @paliwo_dodatkowo - @paliwo_zjazd
  @przejechane_kilometry = @km_powrot - @km_wyjazd
  @norma = (@zuzycie/@przejechane_kilometry)*100
  return @norma
 end

 def zapisz
 @raport_path = "files/#{@numer_pojazdu}.csv"

   if File.exists?(@raport_path)
    CSV.open(@raport_path, "a+") do |csv|
    csv << [@data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, self.norma_spalania]
   end
   else
    CSV.open(@raport_path, "w+") do |csv|
    csv << ["Data wyjazdu", "Data powrotu", "Dotankowane paliwo", "Zużyte paliwo", "Przejechane kilometry", "Norma l/100km"]
    csv << [@data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, self.norma_spalania]
   end
  end
 end
end