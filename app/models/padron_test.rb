class PadronTest < ApplicationRecord
   self.table_name = "padron_test"
	def self.search(params)
	  # Title is for the above case, the OP incorrectly had 'name'
	  where("first_name LIKE ? OR brand LIKE ? OR date_of_db LIKE ?", "%#{params[:name]}%", "%#{params[:brand]}%", "%#{params[:date_of_db]}%")
	end
end
