class Category < ApplicationRecord
    paginates_per 15
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
    # belongs_to :category ,:foreign_key => "child_id"
    # has_many :categories ,
    has_many :product_categories
    has_many :products, through: :product_categories
    

    def is_child?
        self.kind==1
    end 

    def has_child? 
        Category.where(:parent_id=>self.id).exists?
    end
end
