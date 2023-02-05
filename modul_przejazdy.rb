# własny moduł do dopracowania

class Przejazd
    attr_accessor :pojazd, :wyjazd, :powrot, :przejechane_kilometry, :zuzyte_paliwo, :norma

    def dane
      return "Dane #{@pojazd}, #{@wyjazd}, #{@powrot}, #{@przejechane_kilometry},#{@zuzyte_paliwo}, #{@norma}"  
    end

end

trasa = Przejazd.new

trasa.pojazd = "WWY21221"
trasa.wyjazd = "10.10.2022"
trasa.powrot = "19.10.2022"
trasa.przejechane_kilometry = 2800
trasa.zuzyte_paliwo = 700
trasa.norma = (trasa.zuzyte_paliwo/trasa.przejechane_kilometry)*100

puts trasa.dane