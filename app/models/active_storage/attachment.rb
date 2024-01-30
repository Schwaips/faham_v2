class ActiveStorage::Attachment < ApplicationRecord

  # ...

  def self.ransackable_attributes(auth_object = nil)
    ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
  end

  def self.record_association_class
    ActiveStorage::Attachment::Record
  end

  # ...

end