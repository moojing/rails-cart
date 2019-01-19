class Post < ApplicationRecord
    paginates_per 10
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
    belongs_to :post_category
end
