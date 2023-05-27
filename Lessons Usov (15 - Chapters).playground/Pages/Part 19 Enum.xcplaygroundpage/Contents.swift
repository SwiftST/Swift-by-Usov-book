import UIKit

// Enum (перечисление) - это объектный тип данных, который предоставляет доступ к различным предопределенным значениям

/*
 Синтаксис перечислений
 enum Name_Enum {
    case value1
    case value2
    vase valueN
 }
 */

enum CurrencyUnit {
    case rouble
    case euro
}

// так же можно писать члены перечисления через запятую
/*
 enum CurrencyUnit {
     case rouble, euro
 }
 */

var roubleCurrency: CurrencyUnit = .rouble
var otherCurrency = CurrencyUnit.euro


// Ассоциируемые значения

enum AdvancedCurrencyUnit {
    case rouble(countries: [String], shortName: String)
    case euro(countries: [String], shortName: String)
    case dollar(nation: DollarCountries, shortName: String)
}

// возможно не указывать имена ассоциируемых значений
/*
 enum AdvancedCurrencyUnit {
     case rouble(countries: [String], shortName: String)
     case euro(countries: [String], shortName: String)
 }
 */

let euroCurrency: AdvancedCurrencyUnit = .euro(countries: ["German", "France"], shortName: "EUR")

// ассоциируемые значения могут различаться для каждого члена перечисления


enum DollarCountries {
    case usa
    case canada
    case australia
}
// дополнительное перечисление dollar см выше

var dollarCurrency: AdvancedCurrencyUnit = .dollar(nation: .usa, shortName: "USD")


// Вложенные перечисления
// Перечесления могут быть частью других перечислений то естб определены в области видимости родительского перечисления

enum AdvancedCurrencyUnitOne {
    enum DollarCountries {
        case usa, australia, canada
    }
    case rouble(countries: [String], shortName: String)
    case euro(countries: [String], shortName: String)
    case dollar(nation: DollarCountries, shortName: String)
}

let australia: AdvancedCurrencyUnitOne.DollarCountries = .australia

// Оператор switch для перечисления

switch dollarCurrency {
case .rouble:
    print("Rouble")
case let .euro(countries, shortName):
    print("Euro \(shortName) \(countries) ")
case .dollar(let nation, let shortName):
    print("Dollar \(shortName) and \(nation)")
}

// Raw value (сырые значения)

enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
}

enum SomeEnum: String {
    case one
    case two
    case three
}

let someEnum = SomeEnum.one
someEnum.rawValue

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto = 999
}

var somePlane: Planet = .mars
somePlane.rawValue

let myPlanet = Planet.init(rawValue: 3)
var anotherPlanet = Planet.init(rawValue: 11)
var somePlanet = Planet(rawValue: 2)


// Cвойства в перечислениях
// свойство в перечислении - это хранилище, аналогичное переменной или константе, доступ к которому осуществляется через экземпляр перечисления
// в качестве свойтв перечисления могут выступать только вычисляемые свойства

enum Car: String {
    case bmw
    case honda
    case geely
    // вычисляемое свойство
    var description: String {
        return self.rawValue
    }
}

// вычисляемое свойство не может быть объявлено как константа, только как переменная
let myCar: Car = .geely
myCar.description

// Методы в перечислениях
// Методы - это функции внутри перечислений

enum Cars: String {
    case bmw
    case honda
    case geely
    // вычисляемое свойство
    var description: String {
        return self.rawValue
    }
    // метод
    func about() {
        print("Перечисление содержит список марок автомобилей")
    }
}

var otherCar = Cars.honda
otherCar.description
otherCar.about()

// Оператор self
// Требуется написать два метода: один будет возвращать сам член перечисления, а второй — его связанное значение.

enum SomeCar: String {
    case bmw
    case honda
    case geely
    // вычисляемое свойство
    var description: String {
        return self.rawValue
    }
    // метод
    func about() {
        print("Перечисление содержит список марок автомобилей")
    }
    // метод возвращающий сам член перечисления
    func descriptionValue() -> SomeCar {
        self
    }
    // метод возвращающий сырое значение перечисления
    func descriptionRawValue() -> String {
        rawValue
    }
}

var anotherCar = SomeCar.honda
anotherCar.descriptionValue()
anotherCar.descriptionRawValue()

// Рекурсивные перечисления

enum AritmeticExpression {
    case addition(Int, Int)
    case substraction(Int, Int)
    // метод определяющий наименование члена перечисления и возвращающий результат операции
    func evaluate() -> Int {
        switch self {
        case .addition(let left, let right):
            return left + right
        case .substraction(let left, let right):
            return left - right
        }
    }
}

var expr = AritmeticExpression.addition(2, 1)
expr.evaluate()

enum ArithmeticExpression {
    // указатель на конкретное значение
    case number(Int)
    // указатель на операцию сложения
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    // указатель на операцию вычитания
    indirect case subtraction(ArithmeticExpression, ArithmeticExpression)
    // метод проводящий операцию
    func evaluate(_ expression: ArithmeticExpression? = nil) -> Int {
        // определение типа операнда (значение или операция)
        switch expression ?? self {
        case let .number(value):
            return value
        case .addition(let left, let right):
            return evaluate(left) + evaluate(right)
        case .subtraction(let left, let right):
            return evaluate(left) - evaluate(right)
        }
    }
}
let hardExpr = ArithmeticExpression.addition(.number(20), .subtraction(.number(10), .number(34)))
hardExpr.evaluate()

// ключевое слово indirect позволяет передать значение типа ArithmeticExpression в качество ассоциированного параметра
