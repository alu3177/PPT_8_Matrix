class Matrix
  attr_reader :numberOfRows, :numberOfCollumns

  def initialize(nRows, nCols)
    raise IndexError if nRows <= 0 or nCols <= 0
    @numberOfRows = nRows
    @numberOfCollumns = nCols
    @matrix = Array.new(nRows) { Array.new(nCols) }
  end

  def to_s
    for i in 0...@numberOfRows
      for j in 0...@numberOfCollumns
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

  def + other
    raise IndexError unless (@numberOfCollumns == @numberOfRows) == (other.numberOfCollumns == other.numberOfRows)
    result = Matrix.new(@numberOfRows, @numberOfCollumns)
    for i in 0...@numberOfRows
      for j in 0...@numberOfCollumns
        result[i,j] = self[i,j] + other[i,j]
      end
    end
    return result
  end

  def * other
    raise IndexError unless @numberOfCollumns = mat.numberOfRows
    result = Matrix.new(@numberOfRows, mat.numberOfCollumns)
    for i in 0...@numberOfRows
      for j in 0...mat.numberOfCollumns
      end
    end
  end

  def == other
    return false unless (@numberOfRows == other.numberOfRows) and (@numberOfCollumns == other.numberOfCollumns)
    for i in 0...@numberOfRows
      for j in 0...@numberOfCollumns
          return false unless (self[i,j] != other[i,j])
      end
    end
    return true
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
      for j in 0...@numberOfCollumns
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
      for j in 0...@numberOfCollumns
        self[i,j] = Random::rand(0..9) # 0 a 9 de momento para facilitar la lectura al imprimir la matriz
      end
    end
  end

  def zero
    0
  end
end
