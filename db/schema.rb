# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140627020427) do

  create_table "categories", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "rfc"
    t.string   "nombre"
    t.string   "apellidos"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "facebook"
    t.string   "lynkedin"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_sales", force: true do |t|
    t.integer  "usuario_id"
    t.boolean  "alcanzado"
    t.datetime "fechainicio"
    t.datetime "fechafin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.float    "importetotal"
    t.float    "preciounitario"
    t.integer  "cantidad"
    t.float    "descuento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "client_id"
    t.datetime "fechaPedido"
    t.datetime "fechaEntrega"
    t.datetime "fechaRealEntrega"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "isbn"
    t.string   "nombre"
    t.integer  "cantidad"
    t.float    "precio"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "client_id"
    t.text     "descripcion"
    t.text     "acuerdo"
    t.string   "medio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "empresa"
    t.string   "nombre"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_details", force: true do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.float    "importetotal"
    t.float    "preciounitario"
    t.integer  "cantidad"
    t.float    "descuento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "usuario_id"
    t.datetime "fecha"
    t.integer  "client_id"
    t.float    "importetotal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                     null: false
    t.string   "email",                        null: false
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.string   "tipoUsuario",                  null: false
    t.string   "nombre",                       null: false
    t.string   "apellidos",                    null: false
    t.string   "telefono",                     null: false
    t.string   "direccion",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"

end
