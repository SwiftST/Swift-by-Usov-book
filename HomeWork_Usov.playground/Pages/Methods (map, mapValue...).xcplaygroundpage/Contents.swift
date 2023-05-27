//: [Previous](@previous)

import Foundation

/*
Задание 1

Ранее мы с вами уже решали данное задание:
Напишите функцию, которая принимает на вход массив с элементами типа Int, а возвращает целое число — сумму всех положительных элементов переданного массива.
К примеру для массива [1,-2,3,4,-5] должно быть возвращено 1+3+4 = 8
В данном случае вам потребуется использовать изученные в этой главе методы для того, чтобы найти наиболее оптимальное решение
*/
func filterArray(integers: [Int]) -> Int {
    return integers.filter {$0 > 0}.reduce(0, +)
}
filterArray(integers: [1, 2, -900, 1, 0, -1, 22])

/*
Задание 2

Напишите функция, которая принимает на вход массив типа [Int] и возвращает так же массив, но в котором все элементы исходного массива возведены в квадрат.
Пример:
[1,2,3,4] -> [1,4,9,16]
*/

func changeArray(integers: [Int]) -> [Int] {
    integers.map { $0 * $0 }
}
changeArray(integers: [1, 2, 3, 4])


/*
Задание 3

Повтор задания из главы 15. В этот раз используйте изученные в данном разделе методы
Напишите функцию, которая принимает на вход массив типа [Int] и, в случае, если количество элементов > 0, то возвращает целое число — произведение всех элементов переданной коллекции. Если количество элементов = 0, то возвращается 0.
Пример
[1,2,3,4] -> 1 * 2 * 3 * 4 = 24
*/

func multiplyInt(integers: [Int]) -> Int {
    guard !integers.isEmpty else {
        return 0
    }
    return integers.reduce(1) { $0 * $1 }
}
multiplyInt(integers: [2, 2, 3])


/*
Задание 4

У вас есть массив, состоящий из произвольного набора целых чисел
Напишиет функцию, которая возвращает массив типа [Int], состоящий только из четных элементов исходной коллекции
Пример:

([1,4,5,1,2,4,6,3,12,3]) -> [4, 2, 4, 6, 12]

*/

func isEven(integers: [Int]) -> [Int] {
    integers.filter { $0 % 2 == 0 }
}
isEven(integers: [1, 2, 3, 4, 5])


/*
Задание 5

Напишите функцию, которая принимает на вход строку и заменяет в ней все цифры на соответсвующие имя слова (например 1 на «один», 8 на «восемь»)

Изменяйте только цифры (от 0 до 9). Не обращайте внимания, на то, что в тексте могут попадаться числа больше 9.
✕

Пример
("Мне 2 года") -> "Мне два года"
("Это стоит 10 рублей") -> "Это стоит одинноль рублей"
*/
var str = "AADEF13"

var str1 = str.map { char in
    if char == "1" {
        return "one"
    }
    return String(char)
}
str1

func converNumber(text: String) -> String {
    var a = text.flatMap { char in
        switch char {
        case "0":
            return "zero"
        case "1":
            return "one"
        case "2":
            return "two"
        case "3":
            return "three"
        case "4":
            return "four"
        case "5":
            return "five"
        case "6":
            return "six"
        case "7":
            return "seven"
        case "8":
            return "eight"
        case "9":
            return "nine"
        default:
            return String(char)
        }
    }
    return String(a)
}
converNumber(text: "My age 32 years old")


/*
Задание 6

Если вы чувствуете в себе силы, то можете доработать алгоритм из предыдущего задания и реализовать полноценную замену чисел на их текстовые аналоги.
Пример
("Я получил 2000 рублей") -> "Я получил две тысячи рублей"

*/

var someText = "My age 32 years old. I birth of 1990 year"

func getIndexNumber(in string: String) -> String {
    func filter(number: Int) -> String {
        var tempString = ""
        var num = number
        let numbers = [
            0: "zero",
            1: "one",
            2: "two",
            3: "three",
            4: "four",
            5: "five",
            6: "six",
            7: "seven",
            8: "eight",
            9: "nine",
            10: "ten",
            11: "eleven",
            12: "twelve",
            13: "thirteen",
            14: "forteen",
            15: "fifteen",
            16: "sixteen",
            17: "seventeen",
            18: "eighteen",
            19: "ninteen",
            20: "twenty",
            30: "thirty",
            40: "forty",
            50: "fifty",
            60: "sixty",
            70: "seventy",
            80: "eighty",
            90: "ninty"
        ]
        while num > 0 {
            if num > 20 {
                tempString = numbers[num / 10 * 10]! + " "
                num %= 10
            } else {
                tempString += numbers[num]!
                num = 0
            }
        }
        return tempString
    }

    func changeInt(integer: String) -> String {
        guard 1...9999 ~= Int(integer)! else {
            return "zero"
        }
        var result = ""
        var tempInt = Int(integer)!
        while tempInt > 0 {
            var delimer = 0
            switch tempInt.description.count {
            case 4:
                delimer = tempInt / 1000
                result += delimer != 0 ? "\(filter(number: delimer)) thousand " : ""
                tempInt = tempInt % 1000 == 0 ? 0 : tempInt - delimer * 1000
            case 3:
                delimer = tempInt / 100
                result += delimer != 0 ? "\(filter(number: delimer)) hundred " : ""
                tempInt = tempInt % 100 == 0 ? 0 : tempInt - delimer * 100
            case 2:
                result += tempInt != 0 ? "\(filter(number: tempInt))" : ""
                tempInt = 0
            default:
                result += "\(filter(number: tempInt))"
                tempInt = 0
            }
        }
        return result
    }
    // Main program
    var isNumber = false
    var tempStr = string
    // массив с индексами цисловых значений в строке
    var numIndex: [ClosedRange<String.Index>] = []
    var arrayIndex: String.Index = string.startIndex
    // поиск всех числовых значений в строке и добавление их индексов в массив
    for index in tempStr.indices {
        guard Int(String(tempStr[index])) != nil else {
            isNumber = false
            continue
        }
        if isNumber {
            numIndex[numIndex.count - 1] = arrayIndex...index
        } else {
            numIndex.append(index...index)
            isNumber = true
            arrayIndex = index
        }
    }
    // итерация по массиву с индексами числовых значений
    for index in numIndex.reversed() {
        let subStr = tempStr[index]
        tempStr.removeSubrange(index)
        tempStr.insert(contentsOf: changeInt(integer: String(subStr)), at: index.lowerBound)
    }
    return tempStr
}



let someIndex = getIndexNumber(in: someText)



var aadsad = someText.index(someText.startIndex, offsetBy: 10)
var aadsad23 = someText.index(someText.startIndex, offsetBy: 10)
someText[aadsad...aadsad23]
var axx: ClosedRange<String.Index>
axx = aadsad...aadsad
axx = aadsad...aadsad23












//: [Next](@next)
