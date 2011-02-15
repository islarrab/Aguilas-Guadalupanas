class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :username, :nombre, :apellido_paterno, :apellido_materno, :horas_ssc, :tec,
  :carrera, :matricula, :semestre, :telefono, :celular, :direccion

  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates_presence_of :password_confirmation, :username, :nombre,
  :apellido_paterno, :apellido_materno, :horas_ssc, :tec, :carrera, :matricula,
  :direccion
  validates_length_of :password, :in 6..20
  validates_length_of :telefono, :in 8..10, :allow_nil => false
  validates_length_of :celular, :is => 10, :allow_nil => true
end
