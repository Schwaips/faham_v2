class CreateTestimonies < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonies do |t|
      t.string :description
      t.string :author
      t.string :title
      t.string :company

      t.timestamps
    end
  end
end
