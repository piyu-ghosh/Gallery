class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :albums, through: :taggings
    before_create { |tag| tag.name = tag.name.downcase}
end
