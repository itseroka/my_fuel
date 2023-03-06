require 'csv'

class Przejazd

 def initialize(numer_pojazdu, data_wyjazdu, data_zjazdu, km_wyjazd, km_powrot, paliwo_wyjazd, paliwo_dodatkowo, paliwo_zjazd, zuzycie, przejechane_kilometry, norma)

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
  @norma = self.norma_spalania
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
    csv << [@data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, @norma]
   end
   else
    CSV.open(@raport_path, "w+") do |csv|
    csv << ["Data wyjazdu", "Data powrotu", "Dotankowane paliwo", "Zużyte paliwo", "Przejechane kilometry", "Norma l/100km"]
    csv << [@data_wyjazdu, @data_zjazdu, @paliwo_dodatkowo, @zuzycie, @przejechane_kilometry, self.norma_spalania]
   end
 end
 puts "Zapisano raport #{@raport_path}"
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