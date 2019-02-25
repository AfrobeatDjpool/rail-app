class CreateSongAudios < ActiveRecord::Migration[5.1]
  def change
    create_table :song_audios do |t|
      t.string :name
      t.integer :song_id

      t.timestamps
    end
  end
end
