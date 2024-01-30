class Lead < ApplicationRecord
  TYPES = ["Un étudiant ou doctorant", "Une société publique ou privée", "Un organisme de formation"]

  validates :last_name, :first_name, :email, :message, presence: true
  # validates :terms, inclusion: [true]
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true

  validates :customer_type, presence: true, inclusion: { in: TYPES }

  def self.ransackable_attributes(auth_object = nil)
    ["company", "created_at", "customer_type", "email", "first_name", "id", "last_name", "message", "newsletter", "phone_number", "terms", "updated_at"]
  end
end
