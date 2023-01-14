puts "Podaj stan licznika"

@przed = gets.chomp.to_f

puts "Podaleś liczbe #{@przed} \n" 

puts "podaj stan licznika po"

@po = gets.chomp.to_f

puts "Podałeś liczbe #{@po}"

puts "Przejechane kilometry to #{@po - @przed} \n"

puts "Podaj stan paliwa przed"

@start = gets.chomp.to_f

puts "Podaj stan paliwa po powrocie"

@koniec = gets.chomp.to_f

puts "Zurzyte paliwo to #{@start - @koniec}"

puts "Twoja norma na 100 km to #{((@start - @koniec)/(@po - @przed))*100}"
