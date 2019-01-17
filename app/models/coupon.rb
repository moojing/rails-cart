class Coupon < ApplicationRecord
    validates_uniqueness_of :code
    validates :code, presence: true
end
