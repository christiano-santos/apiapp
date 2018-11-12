class AdsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :bar, :shows, :restaurante]

    def index
        client_id = request.headers['client']
        new_auth_header = @resource.create_new_auth_token(client_id)
        response.headers.merge!(new_auth_header)
 
	    @ad = Ad.all.order('created_at DESC').page(params[:page])
        paginate json: @ad

    end

    def bar
        client_id = request.headers['client']
        new_auth_header = @resource.create_new_auth_token(client_id)
        response.headers.merge!(new_auth_header)
        @ad = Ad.where(category_id: '2').order('created_at DESC').page(params[:page])
        paginate json: @ad
    end

    def shows
        client_id = request.headers['client']
        new_auth_header = @resource.create_new_auth_token(client_id)
        response.headers.merge!(new_auth_header)
        @ad = Ad.where(category_id: '1').order('created_at DESC').page(params[:page])
        paginate json: @ad
    end

    def restaurante
        client_id = request.headers['client']
        new_auth_header = @resource.create_new_auth_token(client_id)
        response.headers.merge!(new_auth_header)
        @ad = Ad.where(category_id: '3').order('created_at DESC').page(params[:page])
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
        params.require(:user).permit(:category_id, :establishment, :description, :image, :client) 
    end
end
