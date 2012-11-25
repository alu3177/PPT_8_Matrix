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
    raise IndexError unless @numberOfCollumns = other.numberOfRows
    result = Matrix.new(@numberOfRows, other.numberOfCollumns)
    for i in 0...other.numberOfRows
      for j in 0...@numberOfCollumns
        sum = self[i,0] * other[0,j]
        for k in 1...@numberOfCollumns
          sum += self[i,k] * other[k,j]
        end
        result[i,j] = sum
      end
    end
    return result
  end

  def == other
    #return false unless (@numberOfRows == other.numberOfRows) and (@numberOfCollumns == other.numberOfCollumns)
    raise TypeError unless (other.respond_to? :numberOfRows) and (other.respond_to? :numberOfCollumns)
    return false unless [@numberOfRows, @numberOfCollumns] == [other.numberOfRows, other.numberOfCollumns]
    for i in 0...@numberOfRows
      for j in 0...@numberOfCollumns
          return false unless (self[i,j] == other[i,j])
      end
    end
    true
  end

  def self.identity size=3 # Por defecto matriz identidad de tamaño 3
    raise "Debe definir una matriz identidad"
  end

  def self.empty_matrix size=3
    raise "Debe definir una matriz vacia"
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

  def self.identity size=3
    sol = RationalMatrix.new(size, size)
    for i in 0...size
      for j in 0...size
        if i == j
          sol[i,j] = RationalNumber.new(1,1)
        else
          sol[i,j] = RationalNumber.new(0,1)
        end
      end
    end
    return sol
  end

  def self.empty_matrix size=3
    sol = RationalMatrix.new(size, size)
    for i in 0...size
      for j in 0...size
        sol[i,j] = RationalNumber.new(0,1)
      end
    end
    return sol
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

  def self.identity size=3
    sol = IntegerMatrix.new(size, size)
    for i in 0...size
      for j in 0...size
        if i == j
          sol[i,j] = 1
        else
          sol[i,j] = 0
        end
      end
    end
    return sol
  end

  def self.empty_matrix size=3
    sol = IntegerMatrix.new(size, size)
    for i in 0...size
      for j in 0...size
        sol[i,j] = 0
      end
    end
    return sol
  end

end
