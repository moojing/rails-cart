
class Product < ApplicationRecord
    validates_presence_of :name, :image
    include ImageUploader::Attachment.new(:image)     
    
    has_many :product_category
    has_many :category, through: :product_category 
    
end
