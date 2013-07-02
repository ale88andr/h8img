class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email

      t.timestamps
    end
    # Добавляем уникальность для столбца username
    add_index :users, :username, unique:true
  end
end
