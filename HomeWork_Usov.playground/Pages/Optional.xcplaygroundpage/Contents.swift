//: [Previous](@previous)

import Foundation

/*
 Задание 1

 Какое значение у каждой из приведенных переменных?

 var easy: String? = nil // Optional<String>
 var medium: String! //nil = Переменная не инициализирована
 var hard: String // = Переменная не инициализирована
*/

var easy: String? // = nil Optional<String>
var medium: String! // = nil Переменная не инициализирована
type(of: medium)
var hard: String // = Переменная не инициализирована


/*
 Задание 2

 В чем отличие переменных easy и medium из предыдущего задания?

*/
// Medium - Implicitly optional косвенно извлеченный опционал
// Easy - опционал



/*
 Задание 3

 Будет ли корректно выполнен следующий программный код? Если в нем присутствуют ошибки, то по-возможности исправьте их.

 easy = "1"
 medium = "contra"
 hard = "play game"
 easy = medium
 hard = medium
 easy = hard!
 easy = hard
 var gameTuple = (easy, Optional(hard))
 var gameText: String = gameTuple.0
*/

easy = "1"
medium = "contra"
hard = "play game"
easy = medium
hard = medium
easy = hard
easy = hard
var gameTuple = (easy, hard)
var gameText: String = gameTuple.0!



/*
 Задание 4

 Покажите не менее трех способов (с помощью разных синтаксических конструкций) создания переменной типа String?
*/

var varOne: String? = ""
var varTwo = Optional("")
var varThre = String?("")
var varFour: Optional<String> = nil
/*
 Задание 5

 1) Создайте псевдоним типа String с именем Text
 2) Объявите три константы типа Text. Значения дух констант должны состоять только из цифр, а третьей — из букв и цифр
 3) С помощью оператора условия определите те константы, которые состоят только из цифр и выведите из на консоль

 Для преобразования строки в число (для проверки того, из чего она состоит) можно использовать функцию Int(_:)
 ✕
*/

typealias Text = String
let strOne: Text = "1"
let strTwo: Text = "2"
let strThree: Text = "aq1"

if let one = Int(strOne) {
    print(one)
}
if let two = Int(strTwo) {
    print(two)
}
if let three = Int(strThree) {
    print(three)
}

/*
 Задание 6

 В задании используются результаты предыдущего задания
 1) Создайте псевдоним типа (numberOne: Text?, numberTwo: Text?) с именем TupleType.
 2) Создайте три переменные типа TupleType, содержащие следующие значения: ("190", "67"), ("100", nil), ("-65", "70").
 3) С помощью конструкции switch-case определите, какие из кортежей не содержат nil в своем составе и выведите значения их элементов на консоль

 */
typealias TupleType = (numberOne: Text?, numberTwo: Text?)

var tupleOne: TupleType = ("190", "67")
var tupleTwo: TupleType = ("100", nil)
var tupleThree: TupleType = ("-65", "70")
var optionalTuples = [tupleOne, tupleTwo, tupleThree]
for tuple in optionalTuples {
    switch tuple {
    case (nil, nil), (_, nil), (nil, _):
        break
    default:
        print("\(tuple.numberOne!), \(tuple.numberTwo!)")
    }
}



/*
 Задание 7

 Представьте, что вы являетесь преподавателем курсов по шахматам. Ваши занятия посещают ученики и в конце каждого занятия получаю оценку.
 1) Создайте словарь, который будет содержать информацию о ваших студентах и об их успехах.

 Тип данных словаря — [String: [String: UInt]]
 Индекс — это фамилия ученика.
 Значение — еще один словарь, содержащий информацию о дате занятия и полученной оценке.
 В вашем электронном журнале должна находиться информация о трех учениках, по две оценки для каждого. Фамилии и даты придумайте самостоятельно.
 2) Подсчитайте средний балл каждого студента, средний балл группы, и выведите информацию на консоль.

*/
var averageScore: [String: Double] = [:]
var total: Double = 0
var students: [String: [String: UInt]] = [
    
    "Tokov": [
        "01.09.2022": 3,
        "02.10.2022": 4
    ],
    "Grom": [
        "01.09.2022": 5,
        "02.10.2022": 3
    ],
    "Moor": [
        "01.09.2022": 2,
        "02.10.2022": 4
    ]
]
for (name, point) in students {
    var average: UInt = 0
    for i in point {
        average += i.value
    }
    averageScore[name] = Double(average) / Double(point.count)
}

for (name, point) in averageScore {
    print("Student: \(name) have average score - \(point)")
    total += point
}
print("Total average scrore = \(total / Double(averageScore.count))")
/*
 Задание 8

 Основано на предыдущем задании
 Перед вам стоит задача внести в уже существующий словарь оценку за еще одно занятие для студента. Покажите, каким образом это можно сделать.
*/

students["Grom"]?["22.12.2022"] = 4
students["Grom"]?.count


/*
 Задание 9

 1) Создайте псевдоним Coordinates для типа кортежа (alpha: Character?, num: Int?). Данный тип будет описывать координаты шахматной фигуры на игровом поле. Если вместо элементов кортежа стоит nil, значит фигура не находится на игровом поле.
 2) Создайте псевдоним Chessman для типа словаря [String:Coordinates]. Данный тип описывает шахматную фигуру на игровом поле. В ключе словаря должно хранится имя фигуры, например "White King", а в значении — кортеж, указывающий на координаты фигуры на игровом поле.
 3) Создайте переменный словарь figures типа Chessman и добавьте в него три произвольные фигуры, одна из которых не должна иметь координат.
 4) Создайте цикл, которая обходит всех элементы словаря (все фигуры), и проверяет, убита ли очередная фигура (элемент словаря figures), далее выводит на консоль информацию либо о координатах фигуры, либо о ее отсутствии на игровом поле.
 */

typealias Coordinates = (alpha: Character?, num: Int?)
typealias Chessman = [String: Coordinates]
var figures: Chessman = [
    "White king": ("a", 7),
    "Black quenn": ("c", 4),
    "White horse": ("d", nil)
]

for (figure, coordinate) in figures {
    guard let _ = coordinate.alpha, let _ = coordinate.num else {
        print("\(figure) not on battlefield")
        continue
    }
    print("\(figure) - \(coordinate.alpha!)\(coordinate.num!)")
}

//: [Next](@next)
