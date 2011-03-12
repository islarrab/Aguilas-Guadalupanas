class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :nombre
      t.date :fecha
      t.integer :min_de_actv

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
