class AddFinalizadoToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :fin, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :fin
  end
end
