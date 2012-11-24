class RationalNumber
    attr_reader :num, :denom
    include Comparable

    def initialize(numerador, denominador)
        raise ZeroDivisionError, 'Denominator can\'t be zero \'0\'' unless denominador != 0
        @num = numerador
        @denom = denominador
        reduce  # Simplificamos
    end

    # Se encarga de simplificar la fraccion al minimo
    def reduce
        divisor = mcd
        @num = @num / divisor
        @denom = @denom / divisor
        return self
    end

    # Calcula el Máximo como un divisor del numero actual (Algoritmo de Euclides)
    def mcd
        r = [@num, @denom]
        i = 1
        while r[i] != 0 do
            r[i+1] = r[i-1] % r[i]
            i = i + 1
        end
        return r[i-1]
    end

    def to_s
        "#{@num}/#{@denom}"
    end

    def to_f
        @num / @denom
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
        RationalNumber.new(nume, denomi)
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
            RationalNumber.new(new_num, new_denom)
        elsif other.is_a? Integer
            self + RationalNumber.new(other, 1)
        else
            raise TypeError, "Can't add #{self.class} and #{other.class}"
        end
    end

    def - other
        return self + (-other)
    end

    def * other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            RationalNumber.new(self.num * other.num, self.denom * other.denom)
        elsif other.is_a? Integer
            RationalNumber.new(self.num * other, self.denom)
        else
            raise TypeError, "Can't multiply #{self.class} and #{other.class}"
        end
    end

    def / other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            RationalNumber.new(self.num * other.denom, self.denom * other.num)
        elsif other.is_a? Integer
            RationalNumber.new(self.num, self.denom * other)
        else
            raise TypeError, "Can't divide #{self.class} and #{other.class}"
        end
    end

    def % other
        if ((other.respond_to? :num) and (other.respond_to? :denom))
            if (((other.denom) and (other.num)) != 0)
                return RationalNumber.new(self.num % other.denom, self.denom % other.num)
            else
                raise ZeroDivisionError, 'Denominator can\'t be zero \'0\''
            end
        else
            raise TypeError, "Can't calculate module between #{self.class} and #{other.class}"
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

    def coerce other
        case other
        when Integer
            return RationalNumber.new(other, 1), self
        else
            raise TypeError, "#{self.class} can't be coerced into #{other.class}"
        end
    end
            
            

end
