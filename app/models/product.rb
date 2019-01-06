
class Product < ApplicationRecord
    include ImageUploader::Attachment.new(:image)     
    validates_presence_of :name, :image
end
