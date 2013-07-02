class CreateQms < ActiveRecord::Migration
  def change
    create_table :qms do |t|
      t.references :user
      t.text :message
      t.integer :recipient

      t.timestamps
    end
    add_index :qms, :user_id
  end
end
