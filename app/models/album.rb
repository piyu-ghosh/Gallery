class Album < ApplicationRecord
  has_many_attached :images
  has_one_attached :cover_image
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :title, length: { minimum: 5}
  validates :title, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum:100, too_long: "%{count} characters is the maximum allowed" }
  validates :title, presence: { message: "must be given please" }
  before_create { |album| album.title = album.title.capitalize}
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
  def all_tags
    tags.map(&:name).join(", ")
  end
end
