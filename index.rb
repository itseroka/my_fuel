# kalkulator normy spalania
# uruchom za pomocą komendy $ ruby index.rb

# wartości - paliwo
@a = 0
@b = 0
@c = 0
@zuzycie = @a + @b - @c

@petla = ""

# czyszczenie konsoli
system("clear")
puts "Podaj stan licznika przy wyjeździe w trase"
@przed = gets.chomp.to_f

puts "Podaj stan licznika po powrocie na baze"
@po = gets.chomp.to_f

@przejechanekilometry = @po - @przed

puts "Podaj stan paliwa podczas startu"
@a = gets.chomp.to_f

puts "czy bylo dotankowanie? tak/nie"
until @petla == "nie"
  @petla = gets.chomp
    if @petla == "tak"
    puts "Podaj liczbę do dodania"
    @b = @b + gets.chomp.to_f
    puts "czy chcesz dodać więcej? TAK/NIE"
    puts "twoje dotankowania to #{@b}"
  end
end


puts "Podaj stan paliwa po powrocie"
@c = gets.chomp.to_f

puts "Przejechane kilometry to #{@przejechanekilometry}"
puts "Zurzyte paliwo to #{@a + @b - @c}"

@zuzycie = @a + @b - @c

puts "Twoja norma na 100 km to #{(@zuzycie/@przejechanekilometry)*100}"