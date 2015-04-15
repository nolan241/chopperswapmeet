class PinAttachment < ActiveRecord::Base
   mount_uploader :pictures, PicturesUploader
   belongs_to :pin
end
