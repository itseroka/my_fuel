# 1. utworzyłem plik apka.rb, 
# zainstalowałem gema sinatra
# pierwszy kod:
# require 'sinatra'
# get '/' do
#     'Hello world'
# end

# Wyświetla napis, otworzenie pliku przez komendę ruby apka.rb - działa na localhost:4567

# 2. Utworzyłem klasę poniżej, dodałem plik Gemfile bez rozszerzenia, zawiera:

# source 'https://rubygems.org'- źródło

# gem 'rack' - server
# gem 'sinatra' - gem do api

# Gemfile.lock generuje się autamatycznie po uruchomieniu 'bundle install'

# Dodałem plik config.ru, kod:
# require 'rubygems' - zaciąga gemy
# require 'bundler' - zaciąga bundler ale w sumie nie wiem

# Bundler.require - to nie wiem

# require './apka' - zaciąga główny plik

# run Apka - uruchamia klasę z pliku apka.rb

# class Apka < Sinatra::Base
#     get '/' do
#         'Hello world'
#     end
# end

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
  
    if File.exist?(@raport_path)
      file = File.read(@raport_path)
      @item = CSV.parse(file)
      @numer_pojazdu = numer_pojazdu
      erb :csv_raport
    else
      @error_message = "Brak danych dla podanego numeru rejestracyjnego"
      erb :szukaj
    end
  end

  post '/wyjazd' do
    przejazd = Przejazd.new(params[:numer_pojazdu].upcase)
    przejazd.wyjazd(params[:data_wyjazdu], params[:km_wyjazd].to_f, params[:paliwo_wyjazd].to_f)
    response.set_cookie('message', przejazd.message)

    redirect '/'
  end

  post '/tankowanie' do
    przejazd = Przejazd.new(params[:numer_pojazdu].upcase)
    paliwo_dodatkowo = params[:paliwo_dodatkowo].map(&:to_f)
    suma_paliwa = paliwo_dodatkowo.sum
    przejazd.dodaj_tankowanie(params[:data_tankowania], suma_paliwa)
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
    paliwo_dodatkowo = params[:paliwo_dodatkowo].map(&:to_f)
    suma_paliwa = paliwo_dodatkowo.sum
    przejazd.cala_trasa(params[:data_wyjazdu], params[:km_wyjazd].to_f, params[:paliwo_wyjazd].to_f, params[:data_tankowania], suma_paliwa, params[:data_zjazdu], params[:km_powrot].to_f, params[:paliwo_zjazd].to_f)
    response.set_cookie('message', przejazd.message)

    redirect '/'
  end
  
  get '/lista_plikow' do
    @pliki = Dir.entries('./data').reject { |file| File.directory?(file) }
    erb :lista_plikow
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

  get '/szukaj' do
    erb :szukaj
  end

end

# 3. Tworze widok czyli katalog views a w nim plik index.erb - dodaje do get'a w apka.rb:
#     erb :index
# żeby go wczytać