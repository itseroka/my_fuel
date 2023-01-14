puts "Podaj stan licznika"

@przed = gets.chomp.to_f

puts "Podaj stan licznika po"

@po = gets.chomp.to_f

@przejechanekilometry = @po - @przed

puts "Podaj stan paliwa przed"

@start = gets.chomp.to_f

puts "Podaj stan paliwa po powrocie"

@koniec = gets.chomp.to_f

puts "Zurzyte paliwo to #{@start - @koniec}"

@zuzycie = @start - @koniec

puts "Twoja norma na 100 km to #{(@zuzycie/@przejechanekilometry)*100}"