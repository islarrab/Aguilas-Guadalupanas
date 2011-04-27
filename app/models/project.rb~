class Project < ActiveRecord::Base
  has_many :activities, :dependent => :destroy
  belongs_to :coordinator, :class_name => "User", :foreign_key => "coordinator_id"
  accepts_nested_attributes_for :activities
  
  has_many :users, :through => :project_users
  
  validates_presence_of :nombre, :fecha, :min_de_actv
  validates_numericality_of :min_de_actv, :only_integer => true, :greater_than => 0
end
