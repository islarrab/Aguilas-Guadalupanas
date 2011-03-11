require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true    
  end

  test "user info that must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:username].any?
    assert user.errors[:password].any?
    assert user.errors[:nombre].any?
    assert user.errors[:apellido_paterno].any?
    assert user.errors[:apellido_materno].any?
    assert user.errors[:email].any?
    assert user.errors[:telefono].any?
    assert user.errors[:direccion].any?
    assert user.errors[:tec].any?
    assert user.errors[:matricula].any?
    assert user.errors[:semestre].any?
    assert user.errors[:carrera].any?
    assert user.errors[:horas_ssc].any?
  end

  test "user valid creation" do
    user = users(:sample)
    user.password = "blablabla"
    user.password_confirmation = "blablabla"
    assert user.valid?
  end

  test "user username validation" do
    user = users(:sample)
    user.password = "blablabla"
    user.password_confirmation = "blablabla"
    user.username = "aaaaa" # less than 6 char
    assert user.invalid?
    user.username = "username" # valid username
    assert user.valid?
    user.username = "aaaaaaaaaaaaaaaaaaaaa" # more than 20 char
    assert user.invalid?
  end

  test "user password validation" do
    user = users(:sample)
    # Password not matching confirmation
    user.password = "password"
    user.password_confirmation = "notmatching"
    assert user.invalid?
    # Password less than 6 chars
    user.password = "passw"
    user.password_confirmation = "passw"
    assert user.invalid?
    # Password more than 20 chars
    user.password = "passwordmorethan20cha"
    user.password_confirmation = "passwordmorethan20cha"
    assert user.invalid?
    # Valid password
    user.password = "password"
    user.password_confirmation = "password"
    assert user.valid?
  end

  test "user email validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Invalid Emails
    user.email = "@.com"
    assert user.invalid?
    user.email = "lorem@.com"
    assert user.invalid?
    user.email = "@ipsum.com"
    assert user.invalid?
    # Valid Email
    user.email = "lorem@ipsum.com"
    assert user.valid?
  end

  test "user telefono validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Telefonos Invalidos
    user.telefono = "8300000" # Telefono con menos de 8 caracteres
    assert user.invalid?
    user.telefono = "83000000000" # Telefono con mas de 10 caracteres
    assert user.invalid?
    user.telefono = "8A000000" # Telefono con otra letras
    assert user.invalid?
    user.telefono = "83-00000" #Telefono con otros caracteres
    assert user.invalid?
    # Telefonos Validos
    user.telefono = "83000000" # Telefono normal
    assert user.valid?
    user.telefono = "8183000000" # Telefono con Lada para extranjeros
    assert user.valid?
  end

  test "user celular validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Celular Invalidos
    user.celular = "818000000" # Celular con menos de 10 caracteres
    assert user.invalid?
    user.celular = "81800000000" # Celular con mas de 10 caracteres
    assert user.invalid?
    user.celular = "818A000000" # Celular con otra letras
    assert user.invalid?
    user.celular = "818-000000" # Celular con otros caracteres
    assert user.invalid?
    # Telefonos Validos
    user.celular = "8180000000" # Celular normal
    assert user.valid?
    user.celular = "" # Usuario no puso numero de celular
    assert user.valid?
  end

  test "user matricula validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Matricula Invalida
    user.matricula = "A00000000"
    assert user.invalid?
    # Matricula Valida
    user.matricula = "000000"
    assert user.valid?
  end

  test "user semestre validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Semestre invalido
    user.semestre = "13" # Semestre mayor a 12
    assert user.invalid?
    user.semestre = "0" # Semestre 0
    assert user.invalid?
    user.semestre = "-1" # Semestre negativo
    assert user.invalid?
    # Semestre Valido
    user.semestre = "4"
    assert user.valid?
  end

  test "user carrera validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Carrera Invalida
    user.carrera = "Ingeniero en Tecnologias Computacionales"
    assert user.invalid?
    # Carrera Valida
    user.carrera = "IT"
    assert user.valid?
    user.carrera = "ITC"
    assert user.valid?
    user.carrera = "ITIC"
    assert user.valid?
  end

  test "user horas ssc validation" do
    user = users(:sample)
    user.password = "password"
    user.password_confirmation = "password"
    # Horas SSC invalidas
    user.horas_ssc = "-1" # Horas Negativas
    assert user.invalid?
    user.horas_ssc = "501" # Horas mayor a 500
    assert user.invalid?
    # HOras SSC validas
    user.horas_ssc = "0" # Empezando
    assert user.valid?
    user.horas_ssc = "240" # Numero Valido
    assert user.valid?
  end
end
