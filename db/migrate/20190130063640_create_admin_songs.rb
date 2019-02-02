class CreateAdminSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_songs do |t|
      t.integer :user_id
      t.string :name_song
      t.string :beats
      t.string :genre
      t.string :version
      t.string :name_artist
      t.date :date_upload

      t.timestamps
    end
  end
end
