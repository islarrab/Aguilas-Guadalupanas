require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "activity normal validation" do
    activity = activities(:one)
    assert activity.valid?
  end

  test "activity validate valor" do
    activity = activities(:one)
    # Valores Invalidos
    activity.valor = nil # Sin valor
    assert activity.invalid?
    activity.valor = -1 # Valor negativo
    assert activity.invalid?
    # Valor valido
    activity.valor = 0
    assert activity.valid?
  end
end
