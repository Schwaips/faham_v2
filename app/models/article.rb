class Article < ApplicationRecord
  has_many_attached :photos

  has_rich_text :content

  validates :title, presence: true
end
