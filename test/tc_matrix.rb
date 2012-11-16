require 'matrix'
require 'test/unit'

class TestMatrix < Test::Unit::TestCase

  def setup
    # crear una matriz Random (en cuanto a contenido, no en cuanto a tamaño)
    # Crear matriz de elementos neutros (0 en la suma de entero, y matriz de ceros con diagonal a 1 para multiplicacion)
    # de ese modo la suma/multiplicacion da igual a la generada aleatoriamente
  end

  def test_simple
    assert_equal( @matRandom + @matIdentSuma, @matEandom, "Suma de matrices de enteros")
  end

  def test_typecheck
    assert_raise( TypeError ) { [[1,2,3][4,5,6]] * [[1,1,1],[1,1,1]] } # Esto falla
    assert_raise( TypeError ) { [[1,2,3][4,5,6]] * [[Fraction.new(1,1), Fraction.new(2,1) ...]] } # Terminar
  end

end
