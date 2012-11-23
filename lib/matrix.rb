class Matrix
  attr_reader :numberOfRows, :numberOfColumns

  def initialize(nRows, nCols)
    raise IndexError if nRows <= 0 and nCols <= 0
    @numberOfRows = nRows
    @numberOfColumns = nCols
    @matrix = Array.new(nRows) { Array.new(nCols) }
  end

  def to_s
    for i in 0...@numberOfRows
      for j in 0...@numberOfColumns
        print "#{self[i,j]} "
      end
      puts
    end
  end
  
  def [](i,j)
    @matrix[i][j]
  end

  def []=(i,j,value)
    @matrix[i][j] = value
  end

  def + mat
  end

  def * mat
    raise IndexError unless @numberOfColumns = mat.numberOfRows
    result = Matrix.new(@numberOfRows, mat.numberOfColumns)
    for i in 0...@numberOfRows
      for j in 0...mat.numberOfColumns
      end
    end
  end

  def zero
    raise "Debe definir un valor 'zero'."
  end

end

require 'rational'

class RationalMatrix < Matrix
  def initialize(nRows, nCols)
    super
    for i in 0...@numberOfRows
      for j in 0...@numberOfColumns
        self[i,j] = RationalNumber.new(Random::rand(0..9), Random::rand(1..9)) # 0 a 9 de momento para facilitar la lectura al imprimir la matriz
      end
    end
  end

  def zero
    Fraction.new(0,1)
  end
end

class IntegerMatrix < Matrix
  def initialize(nRows, nCols)
    super
    for i in 0...@numberOfRows
      for j in 0...@numberOfColumns
        self[i,j] = Random::rand(0..9) # 0 a 9 de momento para facilitar la lectura al imprimir la matriz
      end
    end
  end

  def zero
    0
  end
end
