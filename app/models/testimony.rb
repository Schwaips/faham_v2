class Testimony < ApplicationRecord
  validates :title, :description, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["author", "company", "created_at", "description", "id", "title", "updated_at"]
  end
end
