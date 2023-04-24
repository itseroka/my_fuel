require 'csv'

class Przejazd_proces
    attr_accessor :numer_pojazdu, :data_wyjazdu, :km_wyjazd, :paliwo_dodatkowoot
    def initialize(numer_pojazdu, data_wyjazdu, km_wyjazd, paliwo_wyjazd)
      @numer_pojazdu = numer_pojazdu
      @data_wyjazdu = data_wyjazdu
      @km_wyjazd = km_wyjazd
      @paliwo_wyjazd = paliwo_wyjazd
    end

    def wyjazd
      @raport_path = "progress/#{@numer_pojazdu}.csv"

      CSV.open(@raport_path, "w+") do |csv|
        csv << ["Wyjazd", @data_wyjazdu, @km_wyjazd, @paliwo_wyjazd]
       end
    end

  end
  