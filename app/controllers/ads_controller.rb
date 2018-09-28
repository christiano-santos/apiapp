class AdsController < ApplicationController
    #responde_to :json
    before_action :authenticate_user!, only: [:show]

    def index
	@ad = Ad.all.page(params[:page])
	paginate json: @ad
    end
    
    def create(ad) 
        @ads = Ad.new()
        @ads = ad
        if @ads.save
            puts " Anuncio salvo!"
           
        else
            puts " Falha ao salvar anuncio"
            puts errors: @ads.errors
        end
    end
    private
    def user_params
        params.require(:user).permit(:category_id, :establishment, :description, :image)
    end
end
