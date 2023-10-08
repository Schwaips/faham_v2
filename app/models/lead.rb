class Lead < ApplicationRecord

  validates :last_name, :first_name, :email, :message, presence: true
  validates :acceptation, inclusion: [true]
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true

  TYPE = ["Un étudiant ou doctorant", "Une société publique ou privée", "Un organisme de formation"]
  validates :type, presence: true, inclusion: { in: NEED }
end
