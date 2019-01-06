class Image < ApplicationRecord
    include ImageUploader::Attachment.new(:image)     
    validates_presence_of  :image
end
