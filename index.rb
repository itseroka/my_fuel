# kalkulator normy spalania
# uruchom za pomocą komendy $ ruby index.rb
require 'csv'
# wartości - paliwo
@a = 0
@b = 0
@c = 0
@zuzycie = @a + @b - @c

@petla = ""

# czyszczenie konsoli
system("clear")

puts "Witaj w kalkulatorze norm spalania, bdziesz poproszony o numer rejestracyjny pojazdu, date wyjazdu, datę powrotu, stan początkowy paliwa, dodatnkowania oraz stan końcowy paliwa żeby obliczyć normę zużycia paliwa l/100 km"

puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"

puts "Podaj numer rejestracyjny pojazdu"
@pojazd = gets.chomp

puts "Podaj datę wyjazdu - przykład 01.02 [rok doda się automatycznie]"
@data = gets.chomp
@data = "#{@data}.2022"

puts "Podaj datę zjazdu - przykład 09.02 [rok doda się automatycznie]"
@zjazd = gets.chomp
@zjazd = "#{@zjazd}.2022"

puts "Podaj stan licznika przy wyjeździe w trase"
@przed = gets.chomp.to_f

puts "Podaj stan licznika po powrocie na baze"
@po = gets.chomp.to_f
@przejechanekilometry = @po - @przed

puts "Podaj stan paliwa podczas startu"
@a = gets.chomp.to_f

puts "Czy bylo dotankowanie? tak/nie"
until @petla == "nie"
  @petla = gets.chomp
    if @petla == "tak"
    puts "Podaj liczbę do dodania"
    @b = @b + gets.chomp.to_f
    puts "Twoje dotankowania to #{@b}"
    puts "Czy chcesz dodać więcej? [tak/nie]"
  end
end

puts "Podaj stan paliwa po powrocie"
@c = gets.chomp.to_f

@zuzycie = @a + @b - @c
@norma = (@zuzycie/@przejechanekilometry)*100

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Twój pojazd to #{@pojazd}"
puts "Data wyjazdu: #{@data} / Data zjazdu: #{@zjazd}"
puts "Przejechane kilometry to #{@przejechanekilometry}"
puts "Zurzyte paliwo to #{@a + @b - @c}"
puts "Twoja norma na 100 km to #{@norma}"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

CSV.open("#{@pojazd}#{@data}#{@zjazd}.csv", "w") do |csv|
  csv << ["Pojazd", "Data wyjazdu", "Data powrotu", "Dotankowane paliwo", "Zużyte paliwo", "Norma l/100km"]
  csv << ["#{@pojazd}", "#{@data}", "#{@zjazd}", "#{@b}", "#{@zuzycie}", "#{@norma}"]
end

puts "Zapisano raport #{@pojazd}#{@data}#{@zjazd}.csv"