
class Product < ApplicationRecord
    validates_presence_of :name, :image
    include ImageUploader::Attachment.new(:image)     
    
    
    
end
