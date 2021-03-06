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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110401012616) do

  create_table "activities", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha"
    t.time     "hora"
    t.time     "duracion"
    t.integer  "valor"
    t.integer  "actividad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.text     "comment"
  end

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha"
    t.integer  "min_de_actv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "fin",            :default => false
    t.integer  "horas_tec",      :default => 0
    t.integer  "horas_udem",     :default => 0
    t.text     "descripcion"
    t.integer  "coordinator_id"
  end

  create_table "teams", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "Prueba"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "coordinator"
    t.boolean  "admin"
    t.string   "username"
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.integer  "horas_ssc"
    t.boolean  "tec"
    t.string   "matricula"
    t.string   "carrera"
    t.integer  "semestre"
    t.string   "telefono"
    t.string   "celular"
    t.string   "direccion"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
