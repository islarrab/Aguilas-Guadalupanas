class AddInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :nombre, :string
    add_column :users, :apellido_paterno, :string
    add_column :users, :apellido_materno, :string
    add_column :users, :horas_ssc, :integer
    add_column :users, :tec, :boolean
    add_column :users, :matricula, :string
    add_column :users, :carrera, :string
    add_column :users, :semestre, :integer
    add_column :users, :telefono, :string
    add_column :users, :celular, :string
    add_column :users, :direccion, :string
  end

  def self.down
    remove_column :users, :direccion
    remove_column :users, :celular
    remove_column :users, :telefono
    remove_column :users, :semestre
    remove_column :users, :carrera
    remove_column :users, :matricula
    remove_column :users, :tec
    remove_column :users, :horas_ssc
    remove_column :users, :apellido_materno
    remove_column :users, :apellido_paterno
    remove_column :users, :nombre
    remove_column :users, :username
  end
end
