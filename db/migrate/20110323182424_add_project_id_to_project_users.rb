class AddProjectIdToProjectUsers < ActiveRecord::Migration
  def self.up
    add_column :project_users, :project_id, :int
  end

  def self.down
    remove_column :project_users, :project_id
  end
end
