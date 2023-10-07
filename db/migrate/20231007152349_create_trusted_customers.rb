class CreateTrustedCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :trusted_customers do |t|
      t.string :title
      t.boolean :display, default: true

      t.timestamps
    end
  end
end
