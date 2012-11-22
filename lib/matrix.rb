class Matrix

  def initialize(nRows, nCols)
    raise IndexError if nRows <= 0 and nCols <= 0
    @numberOfRows = nRows
    @numberOfColumns = nCols
    @array = Array.new(nRows) { array.new(nCols) }
  end

  def [](i,j)
    @array[i][j]
  end

  def []=(i,j,value)
    @array[i][j] = value
  end

  def +(mat)
  end

  def *(mat)
    raise IndexError unless @numberOfColumns = mat.numberOfRows
    result = Matrix.new(@numberOfRows, mat.numberOfColumns)
    for i in 0...@numberOfRows
      for j in 0...mat.numberOfColumns
  end

  def zero
    raise "Debe definir un valor zero."
  end

end

require 'rational'

class FractionMatrix < Matrix
  def zero
    Fraction.new(0,1)
  end
end

class IntegerMatrix < Matrix
  def zero
    0
  end
end
