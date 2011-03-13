class Project < ActiveRecord::Base
  has_many :activities, :dependent => :destroy
  accepts_nested_attributes_for :activities

  validates_presence_of :nombre, :fecha, :min_de_actv
  validates_numericality_of :min_de_actv, :only_integer => true, :greater_than => 0
end
