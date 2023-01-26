time = Time.now.to_i 

puts "Podaj numer rejestracyjny pojazdu"

@odpowiedz = gets.chomp

puts "Pojazd #{@odpowiedz} w dniu [przykładowa data od - do] miał normę [norma] l 100/km"
file_to_save = File.new("test#{time}.txt", "w+")
file_to_save.puts("Pojazd #{@odpowiedz} w dniu [przykładowa data od - do] miał normę [norma] l 100/km")
file_to_save.close