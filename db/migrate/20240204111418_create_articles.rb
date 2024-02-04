class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :publication_date
      t.string :category
      t.string :link
      t.string :intro_text

      t.timestamps
    end
  end
end
