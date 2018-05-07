class AddDateOfDbToRents < ActiveRecord::Migration[5.1]
  def change
    add_column :rents, :date_of_db, :string
  end
end
