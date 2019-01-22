class PostCategory < ApplicationRecord
    paginates_per 15
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
    has_many :posts
    extend ::FriendlyId
    friendly_id :title, use: [:finders, :slugged]
end
