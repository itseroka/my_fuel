require 'csv'

class Przejazd_proces
    attr_accessor :numer_pojazdu, :data_wyjazdu, :km_wyjazd, :paliwo_dodatkowo, :paliwo_wyjazd, :data_zjazdu, :km_powrot, :paliwo_zjazd
    def initialize(numer_pojazdu, data_wyjazdu, km_wyjazd, paliwo_wyjazd, paliwo_dodatkowo, data_zjazdu, km_powrot, paliwo_zjazd)
      @numer_pojazdu = numer_pojazdu
      @data_wyjazdu = data_wyjazdu
      @km_wyjazd = km_wyjazd
      @paliwo_wyjazd = paliwo_wyjazd
      @paliwo_dodatkowo = paliwo_dodatkowo
      @data_zjazdu = data_zjazdu
      @km_powrot = km_powrot
      @paliwo_zjazd = paliwo_zjazd
    end

    def wyjazd
      @raport_path = "progress/#{@numer_pojazdu}.csv"

      CSV.open(@raport_path, "w+") do |csv|
        csv << ["Wyjazd", @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd]
       end
    end

  end
  