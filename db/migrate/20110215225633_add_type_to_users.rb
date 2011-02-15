class AddTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :coordinator, :boolean
    add_column :users, :admin, :boolean
  end

  def self.down
    remove_column :users, :admin
    remove_column :users, :coordinator
  end
end
