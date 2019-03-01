class SongAudio < ApplicationRecord
	mount_uploader :name, ImageUploader
	belongs_to :song
end
