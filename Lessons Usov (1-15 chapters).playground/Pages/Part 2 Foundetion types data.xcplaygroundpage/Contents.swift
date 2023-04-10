//: [Previous](@previous)

//: Lesson 2
import Foundation

let someText = "I learn Swift"

var orksName = "Ruhard"
var elfNames: String = "Eanor"

orksName = "Gomry"
elfNames = "Liasel"

//let firstHobbitsName

var str: String
str = "Hello"
print(str)

var variableOne = 23
let variableOneCopy: Int = variableOne
variableOne = 24
print(variableOneCopy)
print(variableOne)

var signedNum: Int = -32
let unsignedNum: UInt = 128

Int32.min
Int8.max
UInt8.max

let firstFloat: Float = 3.14
let secondFlooat: Float = 1.01
let result1 = firstFloat.truncatingRemainder(dividingBy: secondFlooat)

variableOne.isMultiple(of: 2) // Определиние четности числа

let numObj = Int(2)
numObj

var count = 19
count += 5
count *= 3
count -= 3
count %= 8

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11


1.25e1 // экспонента для десятичных чисел
0xFp-2 // экспонента для шестнадцетиричных чисел

var myWallet: Decimal = 0
let incomeAfterOperation: Decimal = 0.1

myWallet += incomeAfterOperation
myWallet += incomeAfterOperation
myWallet += incomeAfterOperation

let notEmptyString = String("Hello world!")
let someDoubleNumber = 74.22
let someStringNumber = String(someDoubleNumber)

let myCharOverUnicode: Character = "\u{041A}"

typealias AgeType = UInt8
AgeType.max
AgeType.min
var myAge: AgeType = 31
typealias TextType = String
typealias WordType = String
typealias CharType = String

let someText1: TextType = "This is text"
let someWord: WordType = "Word"
let someChar: CharType = "a"
let someString: String = "this is a string type"

var intVar = 12
let myVar = 3.54
print(type(of: myVar))

//  Comparable (сопостовимые типы данных) те типы данных которые можно сравнить с помощью опреаторов (>, <, <=, >=)
"string1" < "string2"

// Equatable (эквивалентные типы данных) типы данных. которые позволяют использовать для сравнения значений == и !=
true == false

// Hashable (хешируемые типы данных) тип данных для значения которого может быть расчитан специальный цифровой код - хеш
let stringForHash = "строка текста"
let intForHash = 23
let boolForHash = true

stringForHash.hashValue
intForHash.hashValue
boolForHash.hashValue

var timeInSecond = 1000
var distanceInKm = 3.1
let speedInMetresInMinuts = (distanceInKm * 1000) / (Double(timeInSecond / 60))

var oneInt = 111
var twoInt = 222
let threeInt = Int(String(oneInt) + String(twoInt))
let fourInt = Int("\(oneInt)\(twoInt)")

/* Задание 3

Объявите две целочисленные переменные типов Int8 и UInt8. В одну из них запишите максимальное значение, которое может принять параметр типа UInt8, в другую — минимальное значение, которое может принять параметр типа Int8. Обратите внимание на то, какое значение в какую переменную может быть записано.
Выведите полученные значения на консоль.
*/
var variableUInt8: UInt8 = UInt8.max
var variableInt8: Int8 = Int8.min
print("Int8 min = \(variableInt8)\nUInt8 max = \(variableUInt8)")

/*Задание 4

Объявите две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно. Обеим переменным должны быть присвоены значения.
Поменяйте значения переменных местами.
Выведите получившиеся значения на консоль. При этом в каждом варианте выводимых данных текстом напишите, какую переменную вы выводите.
 */
var a = 23
var b: Int = 45
var c = a
a = b
b = c
print("a = \(a)\nb = \(b)")

/*Задание 5

Объявите два параметра. Первый из них должен быть константой типа Float с произвольным числовым значением, второй — переменной типа Double с произвольным значением.
Установите новое произвольное значение всем параметрам, для которых эта операция возможна.
*/
let someFloat: Float = 3.14
var someDouble = 5.231321

someDouble = 545.4343
 
/*Задание 6

1) Объявите три константы: одну типа Int со значением 18, вторую типа Float со значением 16.4 и одну типа Double со значением 5.7.
2) Найдите сумму всех трех констант и запишите ее в переменную типа Float.
3) Найдите произведение всех трех констант и запишите его в переменную типа Int. Помните, что вам необходимо получить результат с минимальной погрешностью (т.е. с максимальной точностью).
4) Найдите остаток от деления константы типа Float на константу типа Double и запишите ее в переменную типа Double.
5) Выведите на консоль результаты всех трех операций
*/
let intA = 18
let floatA: Float = 16.4
let doubleA = 5.7

let sumFloat: Float = Float(intA) + floatA + Float(doubleA)
let multiplicationInt = Int(Double(intA) * Double(floatA) * doubleA)
var doubleDivision = Double(floatA.truncatingRemainder(dividingBy: Float(doubleA)))

print("sum Float = \(sumFloat)\nmultiplication Int = \(multiplicationInt)\ndivision double = \(doubleDivision)")

/*Задание 7

1) Объявите переменные a и b целочисленного типа данных и проинициализируйте им значения 2 и 3.
2) Вычислите значение уравнения (a+4b)(a–3b)+a2 и выведите результат на консоль.
 */

var aInt = 2
var bInt = 3

var result = (aInt + 4 * bInt) * (aInt - 3 * bInt) + aInt * aInt
print(result)

/*Задание 8

1) Объявите переменные c и d и присвойте им значения 1.75 и 3.25.
2) Вычислите значение уравнения 2(c+1)2+3(d+1) и выведите результат на консоль.
3) Какой тип данных будет у результата математического выражения?
 */
var cDouble = 1.75
var dDouble = 3.25

var resultTask8 = 2 * (cDouble + 1) * 2 + 3 * (dDouble + 1)
print(resultTask8)
type(of: resultTask8)

/*
 Задание 9

 1) Объявите константу length и запишите в нее произвольное целочисленное значение.
 2) Вычислите площадь квадрата с длиной стороны, равной length.
 3) Вычислите длину окружности радиусом length.
 4) Получите произведение полученных значений
 */
let lentgh = 2
var kvadratS = lentgh * lentgh
let pi = 3.14
var okrLentgh = 2 * pi * Double(lentgh)
print(Double(kvadratS) * okrLentgh)

/*
 Задание 10

 1) Объявите переменную типа String и запишите в нее произвольный строковый литерал.
 2) Объявите константу типа Character, содержащую произвольный символ латинского алфавита.
 3) Объявите две переменные типа Int и запишите в них произвольные значения.
 4) Одним выражением объедините в строковый литерал переменную типа String, константу типа Character и сумму переменных типа Int, а результат запишите в новую константу.
 5) Выведите данную константу на консоль.
 */

var someString10 = "Hello"
let someChar10: Character = "a"
var someInt10 = 10, someInt11 = 11
let result10 = someString10 + String(someChar10) + String(someInt10 + someInt11)
print(result10)

/*
 Задание 11

 Выведите на консоль букву W, составленную из символов «звездочка» (*), расположенных в три строки.
 *   *   *
  * * * *
   *   *
 */

print("*   *   *\n * * * *\n  *   * ")

/*
 Задание 12

 1) Объявите три переменные: в первую запишите номер дня в месяце, во вторую запишите название месяца, в третью запишите год. Тип данных переменных выберите самостоятельно
 2) Выведите на консоль дату в формате «2021 январь 01», используя данные, записанные в объявленные ранее переменные.
 */

var day = "05"
var month = "Март"
var year = 2022
print("\(year) \(month) \(day)")

/*Задание 13

1) Объявите две логические переменные. Значение первой должно быть равно true, второй — false.
2) Получите результат операции логического И и логического ИЛИ, где в качестве операндов используются данные переменные
*/
var isOn = true
var isOff = false
isOn || isOff
isOn && isOff

/*Задание 14

Без использования Xcode (в уме или с помощью ручки и бумаги) вычислите результат следующих логических выражений:

( ( true && false ) || true )
true && false && true || ( true || false )
false || ( false || true ) && ( true && false )
 */
// true
// true
// false

/*Задание 15

1) Объявите строковую константу и запишите в нее ваше имя.
2) Объявите переменную типа Float и запишите в нее ваш вес в килограммах.
3) Объявите переменную типа Int и запишите в нее ваш рост в сантиметрах.
4) Вычислите ваш индекс массы тела и запишите его в переменную. Формула для расчета ИМТ: ИМТ = вес[кг] / рост [в метрах в квадрате]
5) Выведите на консоль текст, содержащий ваши имя и индекс массы тела. При этом используйте значения из объявленных переменных
*/

let myName = "Pavel"
var weight: Float = 76.1
var growth = 182
var iMT = weight / Float((growth * growth) / 10000)
print("My name is \(myName), my IMT = \(iMT)")

/*
 Задание 16

 Посмотрите на код ниже

 let a: Int = 46
 let b: Int = 10
 // 1
 let answer1: Int = (a * 100) + b
 // 2
 let answer2: Int = (a * 100) + (b * 100)
 // 3
 let answer3: Int = (a * 100) + (b / 10)
 // 4
 let answer4: Int = (b / 100) * 12 + Int((Double(a) / 0.01))
 С помощью калькулятора (без использования Xcode) определите значения всех четырех выражений.
 */

// 4610
// 5600
// 4601
// 4600

/*
 Задание 17

 В выражении ниже расставьте скобки, так, чтобы они соответствовали порядку вычисления и не изменяли итоговый результат.

 5 * 3 - 4 / 2 * 2
 */

5 * 3 - (4 / 2 * 2)

/*
 Задание 18

 Объявите две константы a и b типа Double и проинициализируйте им произвольные значения.
 Рассчитайте среднее значение a и b и сохранить результат в константе типа Float с именем average.
 */

let constA = 1.2
let constB = 4.5
let average: Float = Float(constA + constB) / 2


let minutes = 60
for tickMark in stride(from: 0, to: minutes, by: 5) {
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: 5) {
    print(tickMark)
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[3] = +8; board[6] = +11; board[9] = +9; board[10] = +2
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8

var diceRoll = 0
var square = 0


gameLoop: while square < finalSquare {
    diceRoll = Int.random(in: 1...6)
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

//repeat {
//    square += board[square]
//    diceRoll = Int.random(in: 1...6)
//    square += diceRoll
//} while square < finalSquare
//
//print("Game over")

func greetPerson(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hi \(name)")
    
    guard let location = person["location"] else {
        print("Надеюсь у тебя там хорошая погода")
        return
    }
    print("Надеюсь у тебя там в \(location) хорошая погода")
}

greetPerson(person: ["name": "Bob", "location": "Payuta"])



//: [Next](@next)
