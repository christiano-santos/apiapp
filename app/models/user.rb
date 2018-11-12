class User < ActiveRecord::Base
   mount_base64_uploader :avatar, AvatarUploader
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
