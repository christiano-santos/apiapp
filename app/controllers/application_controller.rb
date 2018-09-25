class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
