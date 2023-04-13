require 'csv'

class Przejazd_proces
    attr_accessor :numer_pojazdu, :data_wyjazdu, :km_wyjazd, :paliwo_dodatkowo, :data_zjazdu, :km_powrot, :paliwo_zjazd
    def initialize(numer_pojazdu, data_wyjazdu, km_wyjazd, paliwo_dodatkowo, data_zjazdu, km_powrot, paliwo_zjazd)
      @numer_pojazdu = numer_pojazdu
      @data_wyjazdu = data_wyjazdu
      @km_wyjazd = km_wyjazd
      @paliwo_dodatkowo = paliwo_dodatkowo
      @data_zjazdu = data_zjazdu
      @km_powrot = km_powrot
      @paliwo_zjazd = paliwo_zjazd
    end

  end
  