class AdsController < ApplicationController
    #responde_to :json
    before_action :authenticate_user!, only: [:show]
    
    def create(ad) 
        puts "entrando no controller"
        puts "Exibindo anuncio antes de salvar no banco:"
        puts ad.category_id
        puts ad.establishment
        puts ad.description
        puts ad.image
        puts "Salvando anuncio:"
        @ads = Ad.new()
        @ads = ad
        if @ads.save
            puts " Anuncio salvo!"
           
        else
            puts " Falha ao salvar anuncio"
            puts errors: @ads.errors
        end
    end
end
