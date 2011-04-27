class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer :activity_id
      t.integer :user_id
      t.integer :project_id
      t.text :Prueba
      t.integer :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
