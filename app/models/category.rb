class Category < ApplicationRecord
    paginates_per 15
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
    
    has_many :product_categories
    has_many :products, through: :product_categories
    
end
