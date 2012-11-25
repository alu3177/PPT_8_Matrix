require 'matrix'
require 'rational'

describe Matrix do

	let (:filas) { 5 }
	let (:columnas) { filas }
	before :all do
    	# Creamos las matrices para hacer las comprobaciones
    	@m_int = IntegerMatrix.new(filas, columnas)
    	@m_rat = RationalMatrix.new(filas, columnas)

    	@m_int_sum = IntegerMatrix::empty_matrix(filas) # Matriz vacía (No modficia la suma)
    	@m_int_mul = IntegerMatrix::identity(filas)     # Matriz identidad (No modifica el producto)

	    @m_rat_sum = RationalMatrix::empty_matrix(filas)# Matriz vacía (No modficia la suma)
	    @m_rat_mul = RationalMatrix::identity(filas)	# Matriz identidad (No modifica el producto)
	end

	it "Se debe poder sumar dos matrices de enteros" do
		(@m_int + @m_int_sum).should == @m_int
	end

	it "Se debe poder multiplicar dos matrices de enteros" do
		(@m_int * @m_int_mul).should == @m_int
	end

	it "Se debe poder sumar dos matrices de racionales" do
		(@m_rat + @m_rat_sum).should == @m_rat
	end

	it "Se debe poder multiplicar dos matrices de racionales" do
		(@m_rat * @m_rat_mul).should == @m_rat
	end

	it "Se debe poder sumar dos matrices, una de enteros y otra de racionales" do
		(@m_rat + @m_int_sum).should == @m_rat
	end

	it "Se debe poder multiplicar dos matrices, una de enteros y otra de racionales" do
		(@m_rat * @m_int_mul).should == @m_rat
	end
  
end
