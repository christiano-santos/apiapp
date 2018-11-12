
class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:update]
    respond_to :json
  
    def update 
        
        user = User.find(params[:id])
        if user.update(user_params) 
            client_id = request.headers['client']
            new_auth_header = @resource.create_new_auth_token(client_id)
            response.headers.merge!(new_auth_header)
            render json: user.avatar, status: 200
        else
            client_id = request.headers['client']
            new_auth_header = @resource.create_new_auth_token(client_id)
            response.headers.merge!(new_auth_header)
            render json: {errors: user.errors}, status:422
        end
    end

    private
    def user_params
        params.require(:user).permit(:avatar, :client)
    end
end
