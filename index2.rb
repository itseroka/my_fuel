require_relative "klasa_przejazd"
require 'csv'

trasa = Przejazd.new
trasa.zbierz_dane

puts "TWÓJ POJAZD TO: #{trasa.numer_pojazdu}"

t = Time.now
@nazwa = "#{trasa.numer_pojazdu}#{t.hour}#{t.min}#{t.sec}"

puts "Nazwa raportu będzie nosiła nazwę #{@nazwa}"

CSV.open("files/#{@nazwa}.csv", "w+") do |csv|
    csv << ["Pojazd"]
    csv << [trasa.numer_pojazdu]
  end
  
  puts "Zapisano raport files/#{@nazwa}.csv"
