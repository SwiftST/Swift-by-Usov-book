//: [Previous](@previous)

import Foundation

/*
 Задание 1

 Разработайте функцию, которая принимает на вход значение типа Bool, преобразует его в строку и возвращает. То есть передав true типа Bool должно вернуться "true" типа String, то же самое и для false.
*/

func convertBool(bool: Bool) -> String {
    String(bool)
}
convertBool(bool: false)

/*
 Задание 2

 Напишите функцию, которая принимает на вход массив с элементами типа Int, а возвращает целое число — сумму всех положительных элементов переданного массива.
 К примеру для массива [1,-2,3,4,-5] должно быть возвращено 1+3+4 = 8

*/
//func sumUnsidInt(integers: [Int]) -> Int {
//    integers.reduce(0) { partialResult, nextValue in
//        nextValue > 0 ? partialResult + nextValue : partialResult
//    }
//}
//sumUnsidInt(integers: [1, -100, 1, -2])

func sumUnsideInt(integers: [Int]) -> Int {
    var sum = 0
    for integer in integers {
        sum += integer > 0 ? integer : 0
    }
    return sum
}

sumUnsideInt(integers: [1, -20, 33, -33, 1])

/*
 Задание 3

 Напишите функцию, которая принимает на вход массив типа [Int] и, в случае, если количество элементов > 0, то возвращает целое число — произведение всех элементов переданной коллекции. Если количество элементов = 0, то возвращается 0.
 Пример:
 [1,2,3,4] -> 1 * 2 * 3 * 4 = 24

*/
func multiplyValue(integers: [Int]) -> Int {
    var result = 0
    guard !integers.isEmpty else {
        return result
    }
    result = integers[0]
    for (iteration, value) in integers.enumerated() {
        guard iteration != 0 else {
            continue
        }
        result *= value
    }
    return result
}

multiplyValue(integers: [1, 2])



/*
 Задание 4

 Используя перегрузку (overloading) создайте две одноименные функции, которые могут принимать два однотипных параметра (Int или Double) и возвращают их произведение
 Пример:
 (4, 5) -> 4 * 5 = 20
 (4.1, 5.2) -> 4.1 * 5.2 = 21.32

*/

func multiply(_ valueOne: Int, _ valueTwo: Int) -> Int {
    valueOne * valueTwo
}
func multiply(_ valueOne: Double, _ valueTwo: Double) -> Double {
    valueOne * valueTwo
}
multiply(1, 2)
multiply(1.2, 1.22)


/*
 Задание 5

 Напишите функцию, которая принимает на вход целое число и возвращает противоположное ему целое число
 Пример
 -12 -> 12
 32 -> -32

*/
func opposite(value: Int) -> Int {
    -value
}
opposite(value: 90)


/*
 Задание 6

 Напишите функцию, которая производит подсчет стоимости аренды квартиры с учетом следующих условий:
 1. Один день аренды стоит 850 рублей
 2. При аренде от 3 дней вы получаете скидку в размере 550 рублей от общей суммы
 3. При аренде от 7 дней вы получаете скидку в размере 1620 рублей от общей суммы
 Функция должна принимать на вход количество дней, а возвращать итоговую сумму.
 Пример
 funcName(5) -> 3700
 funcName(9) -> 6030

*/

func rent(count days: Int) -> Int {
    guard days >= 0 else {
        print("Incorrect value")
        return 0
    }
    let rent = days * 850
    switch days {
    case 1, 2:
        return rent
    case 3..<7:
        return rent - 550
    case 7...:
        return rent - 1620
    default:
        return 0
    }
}

rent(count: 0)



/*
 Задание 7

 Напишите функцию, которая принимает на вход массив типа [Int] и значение Int, проверяет содержится ли целочисленный элемент в массиве и возвращает true или false в зависимости от результата проверки
 Покажите не менее двух способов решения данной задачи
 Пример:
 funcName([1,2,3], 4) -> false
 funcName([2,3,4], 3) -> true

*/

func containsInt(array: [Int], value: Int) -> Bool {
    array.contains(value)
}

func containsIntInArray(array: [Int], value: Int) -> Bool {
    var isTrue = false
    for i in array {
        if i == value {
            isTrue = true
        }
    }
    return isTrue
}
containsIntInArray(array: [1, 2, 3, 4, 5], value: 0)

/*
 Задание 8

 Напишите функцию, которая повторяет заданную строку N раз.
 Функция принимает на вход значение типа String (строку для повторений) и значение типа Int (количество повторений) и возвращает полученный результат.
 Пример:
 funcName("Swift", 2) -> "SwiftSwift"
 funcName("Xcode", 0) -> ""

 */



func repeatString(_ string: String, _ count: Int) -> String {
    var tempStr = string
    for _ in 1...count {
        tempStr += string
    }
    return tempStr
}

func repeatStringOne(_ string: String, _ count: Int) -> String {
    String(repeating: string, count: count)
}

repeatString("Swift", 10)
repeatStringOne("sssa", 2)


/*
 Задание 9

 Мальчик находится на N-ом этаже в здании. Мама мальчика смотрит в окно на M-ом этаже здания. Мальчик выпускает из рук мячик, он летит вниз, отскакивает на (высота броска) * L, вновь летит вниз, вновь отскакивает на (высота предыдущего отскока) * L и т.д, пока не окончит отскакивать.
 Реализуйте функцию, которая высчитывает, сколько раз мяч пролетит мимо мамы (вниз и вверх). Функция должна принимать на вход следующие параметры:
 — высота одного этажа (h > 0)
 — этаж мальчика (N >= 2)
 — этаж мамы (M >= 1)
 — коэффициент отскока (L < 1)


 */

func rebound(height heightOneFloor: UInt, boy floorBoy: UInt, mom floorMom: UInt, coef reboundCoef: Float) -> (up: Int, down: Int) {
    guard heightOneFloor > 0, floorBoy > 2, floorBoy > floorMom, floorMom > 1, reboundCoef < 1 else {
        print("Incorrect value")
        return (0, 0)
    }
    var isUp = false
    var (up, down) = (0, 0)
    var height = Float(floorBoy * heightOneFloor)
    let momHeight = floorMom * heightOneFloor
    
    repeat {
        if !isUp {
            down += 1
            height = Float(height) * reboundCoef
            isUp = true
        } else {
            up += 1
            isUp = false
        }
    } while height > Float(momHeight)
    return (up, down)
}

rebound(height: 3, boy: 6, mom: 5, coef: 0.5)



/*
 Задание 10

 Напишите функцию, которая принимает параметр типа String, а возвращает true (типа Bool) если в строке есть только уникальные символы, и false, если в ней есть хотя бы один повторяющийся символ.

*/
// var 1
func containsUnique(text: String) -> Bool {
    var someSet: Set<Character> = []
    for char in text {
        if someSet.contains(char) {
            return false
        } else {
            someSet.insert(char)
        }
    }
    return true
}

containsUnique(text: "Swiftq")

// var 2
func containsUniqueOne(text: String) -> Bool {
    var isTrue = false
    text.sorted { i, j in
        if i == j {
            isTrue = true
        }
        return i > j
    }
    return isTrue
}
containsUniqueOne(text: "aba")

// var 3
func containsUniqueTwo(text: String) -> Bool {
    Set(text).count != text.count
}
containsUniqueTwo(text: "ab")

/*
 Задание 11

 Напишите функцию, которая определяет, состоят ли две переданные в нее строки из одних и тех же символов.

 Пример:

 funcName(in: "abc", and: "bca") // true
 funcName(in: "abc", and: "bcaa") // false

*/


let str1 = "abc"
let str2 = "bca"

str1 < str2
// var 1
func compareText(text: String, and textTwo: String) -> Bool {
    guard text.count == textTwo.count else {
        return false
    }
    for char in text {
        guard textTwo.contains(char) else {
            return false
        }
    }
    return true
}
// var2

func compareTextOne(text: String, and textTwo: String) -> Bool {
    text.sorted() == textTwo.sorted()
}
compareText(text: "abc", and: "cbw")
compareTextOne(text: "abc", and: "acb")

/*
 Задание 12

 Напишите функцию, которая принимает на вход целочисленный диапазон и возвращает из него все простые числа.

*/

func returnSimpleInt(range: ClosedRange<Int>) -> [Int] {
    var tempArray: [Int] = []
    for i in range {
        switch i {
        case 1:
            continue
        case 2, 3, 5, 7:
            tempArray.append(i)
        case let i where i % 2 == 0:
            continue
        case let i where i % 3 == 0:
            continue
        case let i where i % 5 == 0:
            continue
        case let i where i % 7 == 0:
            continue
        default:
            tempArray.append(i)
        }
    }
    return tempArray
}

returnSimpleInt(range: 0...100)



/*
 Задание 13

 Реализуйте функцию pow(Int,Int), которая принимает два целочисленных элемента. Первый указывает на степень второго числа. Результат функции — второй аргумент функции, возведенный в степень (первый аргумент функции).

 Предполагается, что аргументы могут быть только целыми положительными числами
 */

func pow(_ value: Int, _ degree: Int) -> Int {
    guard value > 0, degree > 0 else {
        print("Incorrect value")
        return 0
    }
    var temp = value
    for _ in 1..<degree {
        temp *= value
    }
    return temp
}
pow(3, 1)




//: [Next](@next)
