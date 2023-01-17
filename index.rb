# kalkulator normy spalania
# uruchom za pomocą komendy $ ruby index.rb

# czyszczenie konsoli
system("clear")

puts "Podaj stan licznika przy wyjeździe w trase"

@przed = gets.chomp.to_f

puts "Podaj stan licznika po powrocie na baze"

@po = gets.chomp.to_f

@przejechanekilometry = @po - @przed

puts "Podaj stan paliwa podczas startu"

@start = gets.chomp.to_f

puts "Czy było tankowane? tak/nie"

@tankowanie = gets.chomp

if @tankowanie == "tak"
  puts "Ile?"
  @dotankowano = gets.chomp.to_f
else 
  @tankowanie == "nie"
  @dotankowano = 0
end

puts "dotankowano #{@dotankowano}"

puts "Podaj stan paliwa po powrocie"


@koniec = gets.chomp.to_f

puts "Zurzyte paliwo to #{@start + @dotankowano - @koniec}"

@zuzycie = @start + @dotankowano - @koniec

puts "Twoja norma na 100 km to #{(@zuzycie/@przejechanekilometry)*100}"