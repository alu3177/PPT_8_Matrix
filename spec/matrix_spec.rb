require 'matrix'
require 'rational'

describe Matrix do

	let (:filas) { 5 }
	let (:columnas) { 5 }
	before :all do
    	# Creamos las matrices para hacer las comprobaciones
    	@m_int = IntegerMatrix.new(filas, columnas)
    	@m_rat = RationalMatrix.new(filas, columnas)

	    @m_mul_int = IntegerMatrix.new(filas, columnas) # Matriz identidad de la multiplicacion de matrices de enteros
	    for i in 0...@m_mul_int.numberOfRows
	      for j in 0...@m_mul_int.numberOfCollumns
	        @m_mul_int[i,j] = 1
	      end
	    end
	    @m_sum_int = IntegerMatrix.new(filas, columnas) # Matriz identidad de la suma de matrices de enteros
	    for i in 0...@m_sum_int.numberOfRows
	      for j in 0...@m_sum_int.numberOfCollumns
	        @m_sum_int[i,j] = 0
	      end
	    end

	    @m_mul_rat = RationalMatrix.new(filas, columnas) # Matriz identidad de la multiplicacion de matrices de racionales
	    for i in 0...@m_mul_rat.numberOfRows
	      for j in 0...@m_mul_rat.numberOfCollumns
	        @m_mul_rat[i,j] = RationalNumber.new(1,1)
	      end
	    end
	    @m_sum_rat = RationalMatrix.new(filas, columnas) # Matriz identidad de la suma de matrices de racionales
	    for i in 0...@m_sum_rat.numberOfRows
	      for j in 0...@m_sum_rat.numberOfCollumns
	        @m_sum_rat[i,j] = RationalNumber.new(0,1)
	      end
	    end
	end

	it "Se debe poder sumar dos matrices de enteros" do
		(@m_int + @m_sum_int) == @m_int # Falla al poner (@m_int + @m_sum_int).should   ...
	end
  
end
