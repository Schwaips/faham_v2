class TrustedCustomer < ApplicationRecord
  has_one_attached :photo


  def self.to_be_displayed
    TrustedCustomer.where(display: true)
  end

  # def self.ransackable_associations(auth_object = nil)
  #   ["photo", "blob"]
  # end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "display", "id", "title", "updated_at"]
  end

end
