class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.string :patente
      t.string :dv_patente
      t.string :brand
      t.string :model
      t.string :tipo
      t.datetime :date_ult_trans
      t.string :color
      t.string :rest_color
      t.integer :ano_fab
      t.string :chasis
      t.string :numero_motor
      t.integer :rut
      t.string :dv
      t.string :first_name
      t.integer :cod_act
      t.string :email
      t.integer :rank
      t.datetime :date_act
      t.string :origin
      t.boolean :fines

      t.timestamps
    end
  end
end
