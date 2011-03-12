class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :nombre
      t.date :fecha
      t.time :hora
      t.time :duracion
      t.integer :valor
      t.integer :actividad
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
