class ProjectUser < ActiveRecord::Base
  belongs_to :project, :foreign_key => "project_id"
  belongs_to :user, :foreign_key => "user_id"
  
  validates_uniqueness_of :user_id, :scope => :project_id
  
end
