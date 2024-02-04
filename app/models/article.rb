class Article < ApplicationRecord
  has_many_attached :images

  has_rich_text :content

  validates :title, presence: true
end
