class AddForeignToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :coordinator_id, :integer
  end

  def self.down
    remove_column :projects, :coordinator_id
  end
end
