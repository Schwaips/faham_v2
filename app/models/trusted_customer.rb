class TrustedCustomer < ApplicationRecord
  has_one_attached :photo


  def self.to_be_displayed
    TrustedCustomer.where(display: true)
  end
end
