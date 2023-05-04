require 'csv'

class Przejazd 

    def initialize(rejestracja)
        @rejestracja = rejestracja
    end

    def wyjazd(data_wyjazdu)
        @data_wyjazdu = data_wyjazdu
    end

    def tankowanie(data_tankowania)
        if @tankowania.nil? 
            @tankowania = []
        end

        @tankowania << [data_tankowania]
    end

    def powrot(data_powrotu)
        @data_powrotu = data_powrotu
    end

    def zapisz
        nazwa_pliku = "files/#{@rejestracja}" 
        CSV.open(nazwa_pliku, "w+") do |csv|
            csv << ["wyjazd", @data_wyjazdu]
            for i in 0..@tankowania.length-1
                csv << ["tankowanie"] + @tankowania[i]
            end
            csv << ["powrot", @data_powrotu]
        end
    end

end


przejazd = Przejazd.new("DW 12345")
przejazd.wyjazd("2017-01-01")
przejazd.tankowanie("2017-01-02")
przejazd.tankowanie("2017-01-03")
przejazd.powrot("2017-01-04")
przejazd.zapisz




