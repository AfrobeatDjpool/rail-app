class ImportJob < ApplicationJob
  queue_as :default

  def perform(path,current_user)
    # Do something later
    require 'csv'
    rents = []
    inserts = []
    time = Time.now.to_s(:db)

      CSV.foreach(path, :headers => false, :encoding => 'ISO-8859-1').with_index { |row,index|
        # ["user_id", "patente", "dv_patente", "marca", "modelo", "tipo", "fecha_ult_trans", "color", "resto_color", "ano_fab", "chasis", "numero_motor", "rut", "dv", "nombre", "multas","date_of_db","created_at","updated_at"]
          if index != 0
            # inserts.push "(#{current_user.try(:id)}, #{row[0]}, #{row[1]}, #{row[2]}, #{row[3]}, #{row[4]}, #{row[5]}, #{row[6]}, #{row[7]}, #{row[8]}, #{row[9]}, #{row[10]}, #{row[11]}, #{row[12]}, #{row[13]}, #{row[14]}, #{row[15]}, '#{time}', '#{time}')"
            rent_data = {}
            rent_data["user_id"] = current_user.try(:id)
            rent_data["patente"] = row[0]
            rent_data["dv_patente"] = row[1]
            rent_data["brand"] = row[2]
            rent_data["model"] = row[3]
            rent_data["tipo"] = row[4]
            rent_data["date_ult_trans"] = Time.at(row[5].to_i)
            rent_data["color"] = row[6]
            rent_data["rest_color"] = row[7]
            rent_data["ano_fab"] =  row[8]
            rent_data["chasis"] = row[9]
            rent_data["numero_motor"] = row[10]   
            rent_data["rut"] = row[11]
            rent_data["dv"] = row[12]
            rent_data["first_name"] = row[13]
            rent_data["fines"] = row[14]
            rent_data["date_of_db"] = row[15]       

            rents << rent_data
          end
      }
        #remove first row with column name and make a new array with rents
      # rents = rents[1..rents.length]

    # Rent.import rents
    Rent.create!(rents)

      # @rent = Rent.create!(rents)
    # puts ["user_id", "patente", "dv_patente", "brand", "model", "tipo", "date_ult_trans", "color", "rest_color", "ano_fab", "chasis", "numero_motor", "rut", "dv", "first_name", "fines","date_of_db","created_at","updated_at"]

    #   sql = "INSERT INTO rents (user_id, patente, dv_patente, brand, model, tipo, date_ult_trans, color, rest_color ,ano_fab, chasis, numero_motor, rut, dv, first_name, fines, date_of_db) VALUES #{inserts.join(", ")}"

    #   ActiveRecord::Base.connection.execute(sql) 
  end
end
