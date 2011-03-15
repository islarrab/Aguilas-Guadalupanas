class AddDescripcionToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :horas_tec, :integer, :default => 0
    add_column :projects, :horas_udem, :integer, :default => 0
    add_column :projects, :descripcion, :text
  end

  def self.down
    remove_column :projects, :descripcion
    remove_column :projects, :horas_udem
    remove_column :projects, :horas_tec
  end
end
