
class Product < ApplicationRecord
    validates_presence_of :name
    if :image
        include ImageUploader::Attachment.new(:image)     
    end

    has_many :product_category
    has_many :category, through: :product_category 
    
end
