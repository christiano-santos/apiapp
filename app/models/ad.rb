class Ad < ApplicationRecord
    mount_base64_uploader :image, ImageUploader
   # mount_uploader :image, ImageUploader
    belongs_to :category

end
