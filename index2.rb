require_relative "przejazd"
require 'csv'

trasa = Przejazd.new
trasa.zbierz_dane
trasa.norma_spalania

puts "TWÓJ POJAZD TO: #{trasa.numer_pojazdu}"

# t = Time.now
# @nazwa = "#{trasa.numer_pojazdu}#{t.hour}#{t.min}#{t.sec}"

# puts "Nazwa raportu będzie nosiła nazwę #{@nazwa}"

# CSV.open("files/#{@nazwa}.csv", "w+") do |csv|
#     csv << ["Pojazd", "Data wyjazdu", "Data powrotu", "Dotankowane paliwo", "Zużyte paliwo", "Przejechane kilometry", "Norma l/100km"]
#     csv << [trasa.numer_pojazdu, trasa.data_wyjazdu, trasa.data_zjazdu, trasa.paliwo_dodatkowo, trasa.zuzycie, trasa.przejechane_kilometry, trasa.norma]
#   end
  
#   puts "Zapisano raport files/#{@nazwa}.csv"
trasa.zapisz