require 'matrix'
require 'rational'

describe Matrix do

  before :all do
    # Creamos las matrices para hacer las comprobaciones
    @im = IntegerMatrix(3,3)
    for i in 0..@im.numberOfRows
      for j in 0..@im.numberOfCollumns
        @im[i,j] = 1
      end
    end
  end
  
end
