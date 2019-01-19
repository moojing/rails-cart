class PostCategory < ApplicationRecord
    paginates_per 15
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
    has_many :posts
end
