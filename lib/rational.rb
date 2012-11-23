class RationalNumber
    include Comparable

    def initialize(numerador, denominador)
        @num = numerador
        @denom = denominador
        reduce  # Simplificamos 
    end

    def num
        @num
    end

    def denom
        @denom
    end

    # Se encarga de simplificar la fraccion al minimo
    def reduce
        divisor = mcd
        @num = @num / divisor
        @denom = @denom / divisor
        return self
    end

    # Calcula el Máximo como un divisor del numero actual (Algoritmo de Euclides)
    def mcd other=nil
        r = []
        if (other.respond_to? :denom)
            r = [other.denom, @denom]
        else
            r = [@num, @denom]
        end
        i = 1
        while r[i] != 0 do
            r[i+1] = r[i-1] % r[i]
            i = i + 1
        end
        return r[i-1]
    end

    # Calcula el minimo comun multiplo respecto otro Rational
    def mcm other
        (other.denom * @denom)/mcd(other)
    end


    def to_s
        "#{@num}/#{@denom}"
    end

    def to_f
        @num / @denom
    end

    def == (r)
        if r.kind_of? RationalNumber
            return ( (r.num == self.num) and (r.denom == self.denom) )
        else
            return false
        end
    end

    def abs
        nume = 0
        denomi = 0
        if @num < 0
            nume = @num * -1
        else
            nume = @num
        end
        if @denom < 0
            denomi = @denom * -1
        else
            denomi = @denom
        end
        RationalNumber.new(nume, denomi)  # Devolvemos el numero racional en sí
    end

    def reciprocal
        RationalNumber.new(@denom, @num)
    end

    def -@
        RationalNumber.new(@num * -1, @denom)
    end

    def + other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            new_num = self.num * other.denom + other.num * self.denom
            new_denom = self.denom * other.denom
            result = RationalNumber.new(new_num, new_denom)
            return result.reduce
        end
    end

    def - other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            return self + (-other)
        end
    end

    def * other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            RationalNumber.new(self.num * other.num, self.denom * other.denom)
        end
    end

    def / other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            RationalNumber.new(self.num * other.denom, self.denom * other.num)
        end
    end

    def % other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            if (((other.denom) and (other.num)) != 0)
                RationalNumber.new(self.num % other.denom, self.denom % other.num)
            end
        end
    end

    def <=> other
        if self.to_f < other.to_f
            return -1
        elsif self.to_f == other.to_f
            return 0
        elsif self.to_f > other.to_f
            return 1
        end
    end
            
            

end
