# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180507143516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rents", force: :cascade do |t|
    t.integer "user_id"
    t.string "patente"
    t.string "dv_patente"
    t.string "brand"
    t.string "model"
    t.string "tipo"
    t.datetime "date_ult_trans"
    t.string "color"
    t.string "rest_color"
    t.integer "ano_fab"
    t.string "chasis"
    t.string "numero_motor"
    t.integer "rut"
    t.string "dv"
    t.string "first_name"
    t.integer "cod_act"
    t.string "email"
    t.integer "rank"
    t.datetime "date_act"
    t.string "origin"
    t.boolean "fines"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date_of_db"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "role", default: "normal"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "xiii_comercios", primary_key: "objectid", id: :serial, force: :cascade do |t|
    t.binary "wkb_geometry"
    t.float "rut"
    t.string "dv", limit: 1
    t.string "nombre", limit: 80
    t.string "actividad", limit: 16
    t.float "activida0"
    t.string "direccion", limit: 254
    t.string "comuna", limit: 36
    t.string "region", limit: 8
    t.float "x"
    t.float "y"
    t.string "comercio", limit: 100
    t.string "anexo", limit: 254
    t.string "telefono", limit: 200
    t.string "tipo", limit: 200
    t.string "extra", limit: 78
    t.string "marca", limit: 254
    t.string "concesiona", limit: 254
    t.string "calle", limit: 254
    t.string "numero", limit: 254
    t.string "direcc_ok", limit: 50
    t.string "provincia", limit: 40
    t.string "celular", limit: 30
    t.string "web", limit: 90
    t.string "email", limit: 90
    t.string "calle_ok", limit: 80
    t.float "num_ok"
    t.string "anexo1", limit: 30
    t.string "cadena", limit: 30
    t.string "anexo_nom", limit: 60
    t.string "anexo_dic", limit: 50
    t.string "fono", limit: 200
    t.string "direc_1", limit: 100
    t.string "dir_ok", limit: 120
    t.string "tienda", limit: 25
    t.float "tiendas"
    t.string "comuna2", limit: 60
    t.string "horario", limit: 100
    t.float "id"
    t.string "empresa", limit: 120
    t.string "estado", limit: 60
    t.float "m2"
    t.string "sucursal", limit: 55
    t.string "supermerca", limit: 40
    t.string "ciudad", limit: 25
  end

  create_table "xiii_manzanas_2013", primary_key: "objectid", id: :serial, force: :cascade do |t|
    t.binary "wkb_geometry"
    t.float "area"
    t.float "perimeter"
    t.float "manzent"
    t.string "comuna", limit: 50
    t.string "provincia", limit: 50
    t.string "region", limit: 50
    t.float "no_data"
    t.float "abc1"
    t.float "c2"
    t.float "c3"
    t.float "d"
    t.float "e"
    t.string "gse", limit: 8
    t.float "pxq"
    t.float "hogares"
    t.float "densidad"
    t.float "hombres"
    t.float "mujeres"
    t.float "poblacion"
    t.float "pob_0_4"
    t.float "pob_5_9"
    t.float "pob_10_14"
    t.float "pob_15_19"
    t.float "pob_20_24"
    t.float "pob_25_29"
    t.float "pob_30_34"
    t.float "pob_35_39"
    t.float "pob_40_44"
    t.float "pob_45_49"
    t.float "pob_50_54"
    t.float "pob_55_59"
    t.float "pob_60_64"
    t.float "pob_65_69"
    t.float "pob_70_74"
    t.float "pob_75_79"
    t.float "pob_80_mas"
    t.float "shape_length"
    t.float "shape_area"
  end

  create_table "xiii_servicios", primary_key: "objectid", id: :serial, force: :cascade do |t|
    t.binary "wkb_geometry"
    t.string "nombre", limit: 100
    t.string "sede", limit: 100
    t.string "calle", limit: 100
    t.string "numero", limit: 15
    t.string "direccion", limit: 254
    t.string "anexo", limit: 50
    t.string "comuna", limit: 50
    t.string "region", limit: 5
    t.string "telefono", limit: 200
    t.float "x"
    t.float "y"
    t.string "servicios", limit: 100
    t.string "direcc_ok", limit: 60
    t.integer "fono"
    t.string "propietari", limit: 50
    t.string "tipo", limit: 50
    t.float "csen"
    t.float "distrito"
    t.string "sexo", limit: 4
    t.string "junta", limit: 40
    t.string "circuns", limit: 50
    t.float "desde"
    t.float "hasta"
    t.float "mesas"
    t.string "local", limit: 70
    t.string "delegado", limit: 50
    t.string "dir_ok", limit: 120
    t.string "calle_ok", limit: 100
    t.float "num_ok"
    t.float "cruce"
    t.integer "fono2"
    t.string "email", limit: 100
    t.string "web", limit: 100
    t.string "creencia", limit: 19
    t.float "celular"
    t.string "sucursal_o", limit: 120
    t.string "horario_de", limit: 250
    t.integer "rbd"
    t.integer "matriculas"
    t.integer "lect_2b201"
    t.integer "lect_4b201"
    t.integer "mat_4b2012"
    t.integer "hist_4b201"
    t.integer "lect_8b201"
    t.integer "mat_8b2011"
    t.integer "nat_8b2011"
    t.integer "hist_8b201"
    t.integer "lect_2m201"
    t.integer "mat_2m2012"
    t.integer "aud_3m2012"
    t.integer "lect_3m201"
    t.float "id"
    t.string "empresa", limit: 50
    t.string "servicio", limit: 30
  end

end
