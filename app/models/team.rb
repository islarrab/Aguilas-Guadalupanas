class Team < ActiveRecord::Base
  belongs_to :activity
  belongs_to :project
  belongs_to :leader, :class_name => "users"
  has_many :users, :through => :member

end
