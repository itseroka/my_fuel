# własny moduł do dopracowania - dodać do index

module Trasa
    attr_accessor :numer_pojazdu, :data_wyjazdu, :data_zjazdu, :km_wyjazd, :km_powrot, :paliwo_wyjazd, :paliwo_dodatkowo, :paliwo_zjazd
        def zbierz_dane
            return "Twoje dane to: #{@numer_pojazdu}, #{@data_wyjazdu}, #{@data_zjazdu}, #{@km_wyjazd}, #{@km_powrot}, #{@paliwo_dodatkowo}, #{@paliwo_zjazd}"
        end
end

historia_trasy = Trasa.new

puts "Podaj numer rejestracyjny pojazdu"
historia_trasy.numer_pojazdu = gets.chomp

puts "Podaj datę wyjazdu"
historia_trasy.data_wyjazdu = gets.chomp

puts "Podaj datę zjazdu"
historia_trasy.data_zjazdu = gets.chomp

puts "Podaj stan licznika podczas wyjazdu w trasę"
historia_trasy.km_wyjazd = gets.chomp

puts "Podaj stan licznika po powrocie z trasy"
historia_trasy.km_powrot = gets.chomp

puts "Podaj stan paliwa przy wyjeździe w trasę"
historia_trasy.paliwo_wyjazd = gets.chomp

puts "Czy podczas wyjazdu było dotankowywane paliwo? Podaj: TAK/NIE"
until @tankowania_w_trasie == "NIE"
    @tankowania_w_trasie = gets.chomp
        if @tankowania_w_trasie == "TAK"
            puts "Podaj wartość zatankowanego paliwa"
            historia_trasy.paliwo_dodatkowo = 0
            historia_trasy.paliwo_dodatkowo = historia_trasy.paliwo_dodatkowo + gets.chomp.to_f
            puts "Czy było kolejne tankowanie? Podaj: TAK/NIE"
        end
end

puts "Podaj stan paliwa po powrocie z trasy"
historia_trasy.paliwo_zjazd = gets.chomp


puts historia_trasy.zbierz_dane