class AddOthersColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :show_email, :integer
  	add_column :users, :user_burn, :string
  	add_column :users, :user_country, :string
  	add_column :users, :user_sex, :integer
  	add_column :users, :user_about, :text
  end
end
