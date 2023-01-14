puts "Podaj stan licznika"

@przed = gets.chomp.to_i

puts "Podaleś liczbe #{@przed} \n" 

puts "podaj stan licznika po"

@po = gets.chomp.to_i

puts "Podałeś liczbe #{@po}"

puts "Przejechane kilometry to #{@po - @przed} \n"

puts "Podaj stan paliwa przed"

@start = gets.chomp.to_i

puts "Podaj stan paliwa po powrocie"

@koniec = gets.chomp.to_i

puts "Zurzyte paliwo to #{@start - @koniec}"

