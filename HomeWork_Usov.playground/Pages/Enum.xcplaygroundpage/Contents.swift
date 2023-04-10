//: [Previous](@previous)

import Foundation

/*
Задание 1

1) В конце главы про «Перечисления» мы с вами начали создавать перечисление ArithmeticExpression, позволяющее выполнять арифметические операции. Сейчас перед вами стоит задача доработать данное перечисление, чтобы оно могло производить любые арифметические операции, включая сложение, вычитание, умножение, деление и возведение в степень.
2) Проверьте работу перечисления на произвольных примерах
*/

enum AritmeticExpression {
    
    case value(Int)
    
    indirect case addition(AritmeticExpression, AritmeticExpression)
    indirect case subtraction(AritmeticExpression, AritmeticExpression)
    indirect case multiplication(AritmeticExpression, AritmeticExpression)
    indirect case division(AritmeticExpression, AritmeticExpression)
    indirect case exponentiation(AritmeticExpression, AritmeticExpression)
    
    func evaluate(_ expression: AritmeticExpression? = nil) -> Int {
        switch expression ?? self {
        case .value(let value):
            return value
        case .addition(let one, let two):
            return evaluate(one) + evaluate(two)
        case .subtraction(let one, let two):
            return evaluate(one) - evaluate(two)
        case .multiplication(let one, let two):
            return evaluate(one) * evaluate(two)
        case .division(let one, let two):
            return evaluate(one) / evaluate(two)
        case .exponentiation(let one, let two):
            guard evaluate(two) != 0 else {
                return 0
            }
            var temp = evaluate(one)
            for _ in 1..<evaluate(two) {
                temp = temp * evaluate(one)
            }
            return temp
        }
    }
}

var someExpression: AritmeticExpression = .addition(.value(10), .value(22))
someExpression.evaluate()

someExpression = .subtraction(.value(0), .value(10))
someExpression.evaluate()

someExpression = .multiplication(.value(2), .value(3))
someExpression.evaluate()

someExpression = .division(.value(12), .value(3))
someExpression.evaluate()

someExpression = .exponentiation(.value(3), .value(0))
someExpression.evaluate()


/*
Задание 2

Корректно ли будет выполнен данный код? Если нет, то какие правки необходимо в него внести, чтобы исправить ошибки?
enum Seasons{
    case winter, spring, summer, autumn
}
let whiteSeason = Seasons.winter
var greenSeason: Seasons = .spring
greenSeason = .summer
var orangeSeason = .autumn
var bestSeason = whiteSeason
bestSeason = .summer
*/

enum Seasons {
    case winter, spring, summer, autumn
}
let whiteSeason = Seasons.winter
var greenSeason: Seasons = .spring
greenSeason = .summer
var orangeSeason: Seasons = .autumn
var bestSeason = whiteSeason
bestSeason = .summer

/*
Задание 3

Простейшая модель сущности «Шахматная фигура» может быть выполнена с помощью перечисления.
1) Создайте перечисление Chessman, члены которого определяют возможные типы шахматных фигур (всего 6 типов, без учета цвета).
2) Внутри перечисления Chessman создайте перечисление Color, определяющее возможные цвета шахматных фигур.
3) Для каждого члена перечисления Chessman создайте связанный параметр типа Color, позволяющий указать цвет шахматной фигуры
4) Создайте несколько экземпляров типа Chessman, каждый из которых описывает свою шахматную фигуру
5) Напишите конструкции switch-case, способную обрабатывать параметр типа Chessman и выводить на консоль информацию о типе и цвете фигуры
6) Создайте новую переменную и инициализируйте ей значение типа Color, вложенного в перечисление Chessman

*/

enum Chessman {
    enum Color: String {
        case white, black
    }
    case king(color: Color)
    case queen(color: Color)
    case rook(color: Color)
    case horse(color: Color)
    case elephant(color: Color)
    case pawn(color: Color)
    
}

let blackPawn: Chessman = .pawn(color: .black)
let whiteKing = Chessman.king(color: .white)
whiteKing.self

func printFigure(_ figure: Chessman) {
    var result = ""
    switch figure {
    case .king(color: let color):
        result = "\(color.rawValue) \(figure)"
    case .queen(color: let color):
        result = "\(color.rawValue) \(figure)"
    case .rook(color: let color):
        result = "\(color.rawValue) \(figure)"
    case .horse(color: let color):
        result = "\(color.rawValue) \(figure)"
    case .elephant(color: let color):
        result = "\(color.rawValue) \(figure)"
    case .pawn(color: let color):
        result = "\(color.rawValue) \(figure)"
    }
    print(result)
}
printFigure(blackPawn)
printFigure(whiteKing)


/*
Задание 4

1) Создайте перечисление Day, члены которого указывают на дни недели.
В составе перечисления создайте вычисляемое свойство, которое возвращает наименование дня недели на русском языке (значение типа String), соответсвующее выбранному члену перечисления
2) Проверьте работу перечисления с помощью следующих выражений

let mon = Day.monday
print(mon.label) // Понедельник
print(Day.friday.label) // Пятница
*/

enum Day: String {
    case monday = "Понедельник"
    case tuesday = "Вторник"
    case wednesday = "Среда"
    case thursday = "Четверг"
    case friday = "Пятница"
    case saturday = "Суббота"
    case sunday = "Воскресенье"
    
    var label: String {
        self.rawValue
    }
}
let mon = Day.monday
print(mon.label)
print(Day.friday.label)
 
 
 

//: [Next](@next)
