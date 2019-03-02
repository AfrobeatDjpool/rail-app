class Song < ApplicationRecord
	belongs_to :user
	has_one :song_audio
	# mount_uploader :image, ImageUploader
end
