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

    def parent 
        if self.parent_id.present?
        Category.find(self.parent_id)
        else 
            nil
        end
    end 
    
    def children
        children = Category.where(:parent_id=>self.id)
        if children.exists?
          return   children
        else 
          nil
        end      
    end
end
