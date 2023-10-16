class Testimony < ApplicationRecord
  validates :title, :description, presence: true
end
