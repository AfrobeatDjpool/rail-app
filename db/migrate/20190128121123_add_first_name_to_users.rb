class AddFirstNameToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :second_name, :string
  	add_column :users, :name_label, :string
  	add_column :users, :country, :string
  	add_column :users, :state, :string
  	add_column :users, :facebook_url, :string
  	add_column :users, :instagram_url, :string
  	add_column :users, :twitter_url, :string
  	add_column :users, :name_club, :string
  	add_column :users, :role, :string
  end
end
