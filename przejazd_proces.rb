require 'csv'

class Przejazd_proces
    attr_accessor :numer_pojazdu, :data_wyjazdu, :km_wyjazd
    def initialize(numer_pojazdu, data_wyjazdu, km_wyjazd)
      @numer_pojazdu = numer_pojazdu
      @data_wyjazdu = data_wyjazdu
      @km_wyjazd = km_wyjazd
    end
  end
  