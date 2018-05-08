class Rent < ApplicationRecord

	def self.search(search)
	  # Title is for the above case, the OP incorrectly had 'name'
	  where("first_name LIKE ?", "%#{search}%")
	end
end
