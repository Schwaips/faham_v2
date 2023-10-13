class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :type
      t.text :message
      t.string :phone_number
      t.boolean :newsletter, default: false
      t.boolean :terms, default: false

      t.timestamps
    end
  end
end
