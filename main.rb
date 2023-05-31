system("clear")

puts "Wpisz polecnie aby uruchomić odpowiedni moduł\n- STATYCZNE \n- DYNAMICZNE"

input = gets.chomp.upcase

case input
  when "STATYCZNE"
  load 'start.rb'

  when "DYNAMICZNE"
  load 'start_proces.rb'

else
  puts "Nie odnaleziono - wpisz ponownie komendę"
end