require_relative 'przejazd'

class Apka < Sinatra::Base

  get '/' do
    @message = request.cookies['message']
    response.delete_cookie('message')

    erb :index, layout: :layout
  end
  
  post '/szukaj' do
    numer_pojazdu = params[:numer_pojazdu].upcase
    @raport_path = "./data/#{numer_pojazdu}.csv"

    @pliki = Dir.entries('./data').reject { |file| File.directory?(file) }
    @nazwy_plikow = @pliki.map { |plik| [plik, File.basename(plik, File.extname(plik))] }
  
    if File.exist?(@raport_path)
      file = File.read(@raport_path)
      @item = CSV.parse(file)
      @numer_pojazdu = numer_pojazdu
      erb :zawartosc_pliku
    else
      @error_message = "Brak danych dla podanego numeru rejestracyjnego"
      erb :szukaj
    end
  end

  get '/szukaj' do
    @pliki = Dir.entries('./data').reject { |file| File.directory?(file) }
    @nazwy_plikow = @pliki.map { |plik| [plik, File.basename(plik, File.extname(plik))] }

    erb :szukaj
  end

  get '/pobierz_zawartosc' do
    @plik = params[:plik]
    zawartosc = File.read(File.join('./data', @plik))
  
    @pliki = Dir.entries('./data').reject { |file| File.directory?(file) }
    @nazwy_plikow = @pliki.map { |plik| [plik, File.basename(plik, File.extname(plik))] }
  
    @nazwa_pliku = @nazwy_plikow.to_h[@plik]
    @item = CSV.parse(zawartosc)
  
    erb :zawartosc_pliku
  end

  get '/wyswietl_normy' do
    @plik = params[:plik]
    @raport_path = "./data/#{@plik}"

    @normy = []

    @nazwa_raportu = File.basename(@plik, ".*")

    if File.exists?(@raport_path)
      CSV.foreach(@raport_path) do |row|
        if row[0] == "Norma"
          @normy << row
        end
      end
    end

    erb :wyswietl_normy
  end
  
  post '/usun_ostatni_wiersz' do
    @plik = params[:plik]
    file_path = File.join('./data', @plik)
    rows = CSV.read(file_path)
    
    if rows.any?
      rows.pop
      CSV.open(file_path, 'w') do |csv|
        rows.each do |row|
          csv << row
        end
      end
    end
  
    redirect "/pobierz_zawartosc?plik=#{@plik}"
  end

  post '/usun_raport' do
    @plik = params[:plik]
    file_path = File.join('./data', @plik)
    
    if File.exist?(file_path)
      File.delete(file_path)
    end
    
    redirect '/szukaj'
  end

  post '/potwierdzenie_usuniecia' do
    @plik = params[:plik]
    @nazwa_raportu = File.basename(@plik, ".*")
    erb :potwierdz_usuniecie
  end

  post '/wyjazd' do
    przejazd = Przejazd.new(params[:numer_pojazdu].upcase)
    przejazd.wyjazd(params[:data_wyjazdu], params[:km_wyjazd].to_f, params[:paliwo_wyjazd].to_f)
    response.set_cookie('message', przejazd.message)

    redirect '/'
  end

  post '/tankowanie' do
    przejazd = Przejazd.new(params[:numer_pojazdu].upcase)
    przejazd.dodaj_tankowanie(params[:data_tankowania], params[:paliwo_dodatkowo])
    response.set_cookie('message', przejazd.message)
    
    redirect '/'
  end

  post '/zjazd' do
    przejazd = Przejazd.new(params[:numer_pojazdu].upcase)
    przejazd.dodaj_powrot(params[:data_zjazdu], params[:km_powrot].to_f, params[:paliwo_zjazd].to_f)
    response.set_cookie('message', przejazd.message)

    redirect '/'
  end

  post '/cala_trasa' do
    przejazd = Przejazd.new(params[:numer_pojazdu].upcase)
    przejazd.cala_trasa(params[:data_wyjazdu], params[:km_wyjazd].to_f, params[:paliwo_wyjazd].to_f, params[:data_tankowania], params[:paliwo_dodatkowo], params[:data_zjazdu], params[:km_powrot].to_f, params[:paliwo_zjazd].to_f)
    response.set_cookie('message', przejazd.message)

    redirect '/'
  end

  get '/about' do
    erb :about
  end

  get '/wyjazd_formularz' do
    erb :wyjazd_formularz
  end

  get '/tankowanie_formularz' do
    erb :tankowanie_formularz
  end

  get '/zjazd_formularz' do
    erb :zjazd_formularz
  end

  get '/trasa_formularz' do
    erb :trasa_formularz
  end
  
end