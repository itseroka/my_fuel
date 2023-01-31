# wydzielnik samej normy

require 'csv'

CSV.foreach("test.csv") do |row|
 puts row.inspect
 @wydzielnik = ""
 @wydzielnik = row[5].to_s
end

puts "Wyświetl normę - #{@wydzielnik}"