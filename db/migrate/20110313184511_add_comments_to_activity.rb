class AddCommentsToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :comment, :text
  end

  def self.down
    remove_column :activities, :comment
  end
end
