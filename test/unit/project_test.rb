require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "project normal validation" do
    project = projects(:one)
    assert project.valid?
  end

  test "project validate min de actividades" do
    project = projects(:one)
    # Min de Actividades Invalido
    project.min_de_actv = -1 # Numeros negativos
    assert project.invalid?
    project.min_de_actv = 0 # Sin minimo
    assert project.invalid?
    # Min de Actividades Valido
    project.min_de_actv = 1
    assert project.valid?
  end
end
