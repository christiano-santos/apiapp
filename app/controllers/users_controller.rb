
class UsersController < ApplicationController
    
    respond_to :json

    def update 
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user.avatar, status: 200
        else
            render json: {errors: user.errors}, status:422
        end
    end

    def show 

        @user = User.find(params[:id])
        
         if @user.avatar?
            # image = Base64.encode64(open(Rails.root.join("public", @user.avatar)){ |io| io.read })
            # render json: {image:image}
            avatar = Base64.encode64(open("#{Rails.root}/public/#{@user.avatar.url}"){ |io| io.read })
            render json: {imageb64: avatar}
         else
            head 404
        end    
    end  

    private
    def user_params
        params.require(:user).permit(:avatar)
    end
end
