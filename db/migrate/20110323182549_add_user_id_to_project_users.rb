class AddUserIdToProjectUsers < ActiveRecord::Migration
  def self.up
    add_column :project_users, :user_id, :int
  end

  def self.down
    remove_column :project_users, :user_id
  end
end
