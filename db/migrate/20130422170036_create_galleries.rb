class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :image
      t.references :album_id
      t.references :user_id

      t.timestamps
    end
    add_index :galleries, :album_id_id
    add_index :galleries, :user_id_id
  end
end
