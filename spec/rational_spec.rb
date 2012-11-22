require 'rational'

describe RationalNumber do

    let (:numerador) { 6 }
    let (:denominador) { 4 }
    let (:reducida) {[3, 2]} # Array con el numerador y el denominador reducidos

    before :all do
        @rat = RationalNumber.new(numerador, denominador)
    end

    it "Debe existir un numerador" do
        @rat.num.kind_of? Integer
    end

    it "Debe existir un denominador" do
        @rat.denom.kind_of? Integer and @rat.denom > 0
    end

    it "Debe de estar en su forma reducida" do
        @rat.num.should == reducida[0]
        @rat.denom.should == reducida[1]
    end

    it "Se debe invocar al metodo num() para obtener el numerador" do
        @rat.num().should == reducida[0]
    end

    it "Se debe invocar al metodo denom() para obtener el denominador" do
        @rat.denom().should == reducida[1]
    end

    it "Se debe mostar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador" do
        @rat.to_s.should == "#{reducida[0]}/#{reducida[1]}"
    end

    it "Se debe mostar por la consola la fraccion en formato flotante" do
        @rat.to_f.should == (numerador / denominador)
    end

    it "Se debe comparar si dos fracciones son iguales con ==" do
        rat2 = RationalNumber.new(numerador, denominador)
        @rat.should == rat2
    end

    it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
        rat2 = RationalNumber.new(numerador * -1, denominador)
        rat2.abs.should == @rat
    end

    it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
        rat2 = RationalNumber.new(denominador, numerador)
        @rat.reciprocal.should == rat2
    end

    it "Se debe calcular el opuesto de una fraccion con -" do
        rat2 = RationalNumber.new(numerador * -1, denominador)
        @rat.should == -rat2
    end

    it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
        rat2 = RationalNumber.new(8, 15)
        rat_result = RationalNumber.new(@rat.num * rat2.denom + rat2.num * @rat.denom, @rat.denom * rat2.denom)
        rat_result.reduce

        rat_result.should == @rat + rat2
    end

    it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
        rat2 = RationalNumber.new(8, 15)
        rat_result = RationalNumber.new(@rat.num * rat2.denom - rat2.num * @rat.denom, @rat.denom * rat2.denom)
        rat_result.reduce

        rat_result.should == @rat - rat2
    end

    it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
        rat2 = RationalNumber.new(8, 15)
        rat_result = RationalNumber.new(@rat.num * rat2.num, @rat.denom * rat2.denom)
        rat_result.reduce

        rat_result.should == @rat * rat2
    end

    it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
        rat2 = RationalNumber.new(8, 15)
        rat_result = RationalNumber.new(@rat.num * rat2.denom, @rat.denom * rat2.num)
        rat_result.reduce

        rat_result.should == @rat / rat2
    end

    it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
        rat2 = RationalNumber.new(8, 15)
        rat_result = RationalNumber.new(@rat.num % rat2.denom, @rat.denom % rat2.num)
        rat_result.reduce

        rat_result.should == @rat % rat2
    end

    it "Se debe de poder comprobar si una fracion es menor que otra" do
        rat2 = RationalNumber.new(0, 1)
        (@rat < rat2).should == false
    end

    it "Se debe de poder comprobar si una fracion es mayor que otra" do
        rat2 = RationalNumber.new(0, 1)
        (@rat > rat2).should == true
    end

    it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
        rat2 = RationalNumber.new(0, 1)
        (@rat <= rat2).should == false
    end

    it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
        rat2 = RationalNumber.new(0, 1)
        (@rat >= rat2).should == true
    end

end
