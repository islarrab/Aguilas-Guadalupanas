class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  
  has_many :projects, :through => :project_users
  has_many :teams, :through => :member
  has_many :teams  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :username, :nombre, :apellido_paterno, :apellido_materno, :horas_ssc, :tec,
  :carrera, :matricula, :semestre, :telefono, :celular, :direccion

  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates_presence_of :password_confirmation, :username, :nombre,
  :apellido_paterno, :apellido_materno, :carrera, :matricula,
  :direccion, :semestre
  validates_length_of :username, :in => 6..20
  validates_length_of :password, :in => 6..20
  validates_length_of :carrera, :in => 2..4
  validates_length_of :telefono, :in => 8..10, :allow_nil => false
  validates_length_of :celular, :is => 10, :allow_blank => true
  validates_numericality_of :horas_ssc, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 500
  validates_numericality_of :matricula, :only_integer => true
  validates_numericality_of :semestre, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12
  validates_numericality_of :telefono, :only_integer => true
  validates_numericality_of :celular, :only_integer => true, :allow_blank => true

  def self.search(username, nombre, appat, apmat)
      find(:all, :conditions => ["username LIKE ? AND nombre LIKE ? AND apellido_paterno LIKE ? AND apellido_paterno LIKE ?", "%#{username}%", "%#{nombre}%","%#{appat}%", "%#{apmat}%"], :limit => 50, :order => "username ASC")
  end
end
