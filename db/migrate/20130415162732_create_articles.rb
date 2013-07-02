class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user
      t.references :category
      t.string :title
      t.text :body
      t.integer :views

      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :category_id
  end
end
