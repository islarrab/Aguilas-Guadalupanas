class Activity < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :nombre, :valor, :actividad
  validates_numericality_of :valor, :only_integer => true, :greater_than_or_equal_to => 0
end
