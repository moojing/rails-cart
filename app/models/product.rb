
class Product < ApplicationRecord
    validates_presence_of :name
    paginates_per 15
    # if :image
    #     include ImageUploader::Attachment.new(:image)     
    # end
    has_many :image
    has_many :product_categories
    has_many :categories, through: :product_categories
    
end
