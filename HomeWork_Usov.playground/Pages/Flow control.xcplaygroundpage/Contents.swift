//: [Previous](@previous)

import Foundation

/*
 Задание 1

 Напишите код, который будет выводить на консоль персонализированное приветствие пользователю в зависимости от его имени.
 Пусть в константе name хранится имя пользователя. Используя операторы управления (условия if и ветвления switch) реализуйте различный вывод на консоль в зависимости от значения в константе name
 Покажите варианты решения с использованием switch и if. Определите вывод на консоль для трех произвольных имен, а так же в блоке «во всех остальных случаях» (default и else).
*/
let name = "Pidor"

if name == "Pavel" {
    print("Hi, \(name)")
} else if name == "Lora" {
    print("Hello " + name)
} else if name == "Pidor" {
    print("Hello mister \(name)s")
} else {
    print("Hi unknown \(name)")
}

switch name {
case "Pavel":
    print("Hi, \(name)")
case "Lora":
    print("Hello " + name)
case "Pidor":
    print("Hello mister \(name)s")
default:
    print("Hi unknown \(name)")
}


/*
 Задание 2

 У вас есть логическая переменная open, которая может принять одно из двух доступных значений (true или false) var open = true или var open = false

 Вам необходимо создать новую переменную типа String и инициализировать ей строковое значение:
 — если open равно true, то инициализировать "открыто"
 — если open равно false, то инициализировать "закрыто"
*/

var isOpen = false

var opened = isOpen ? "Open" : "Close"

/*
 Задание 3

 Вам даны три переменные var1, var2 и var3 целочисленного типа Int
 Составьте программу, в конце которой в константе result будет находиться наибольшее из трех целочисленных значений.
*/

var (var1, var2, var3) = (102, 33, 77)
var resultValue = var1
resultValue = resultValue < var2 ? var2 : resultValue
resultValue = resultValue < var3 ? var3 : resultValue


/*

 Задание 4

 Вы имеете три переменные-кортежа, содержащие координаты точек
 Напишите программу, которая определяет, может ли существовать треугольник с заданными координатами вершин

 Треугольник существует только тогда, когда сумма длин любых двух его сторон больше длины третьей.
 ✕
*/


var (coordA, coordB, coordC): ((Double, Double), (Double, Double), (Double, Double)) = ((1, 4), (2, 2), (1, 3))

let sideAB = sqrt((pow((coordB.0 - coordA.0), 2) + pow((coordB.1 - coordA.1), 2)) * 0.5)
let sideBC = sqrt((pow((coordC.0 - coordB.0), 2) + pow((coordC.1 - coordB.1), 2)) * 0.5)
let sideCA = sqrt((pow((coordC.0 - coordA.0), 2) + pow((coordC.1 - coordA.1), 2)) * 0.5)

var lenthTriangle = (sideAB, sideBC, sideCA)

switch lenthTriangle {
case let (a, b, c) where (a + b > c) && (a + c > b) && (b + c > a):
    print("Существует")
default:
    print("Не существует")
}
/*
 Задание 5

 Переменная lang может принимать 2 значения: "ru", "en". Если она имеет значение "ru", то в переменную days запишите массив дней недели на русском языке, а если имеет значение "en" – то на английском
 Покажите решение задачи через конструкцию switch-case
*/
var lang = "ru"
var days: [String] = []
let daysOfWeekRu = [
    "понедельник",
    "вторник",
    "среда",
    "четверг",
    "пятница",
    "суббота",
    "воскресенье"
]
let daysOfWeekEn = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
]
switch lang {
case "ru":
    days = daysOfWeekRu
case "en":
    days = daysOfWeekEn
default:
    print("Incirrect value")
}


/*
 Задание 6

 Основано на предыдущем задании
 У вас появилась дополнительная переменная chars, которая может принять два значения "up" и "down"
 Доработайте конструкцию switch-case таким образом, чтобы в зависимости от значения chars массив заполнялся большими или маленькими символами
*/
var chars = "up"

switch (lang, chars) {
case ("ru", "up"):
    days = daysOfWeekRu.map({ $0.uppercased() })
case ("ru", "down"):
    days = daysOfWeekRu.map({ $0.lowercased() })
case ("en", "up"):
    days = daysOfWeekEn.map({ $0.uppercased() })
case ("en", "down"):
    days = daysOfWeekEn.map({ $0.lowercased() })
default:
    print("incorrect")
}
days



/*
 Задание 7

 1) Определите псевдоним Operation типу кортежа, содержащему три элемента со следующими именами: operandOne, operandTwo, operation.
 Первые два — это числа с плавающей точкой. Они будут содержать операнды для выполнения операции.
 Третий элемент — строковое значение типа Character. Оно будет содержать указатель на проводимую операцию. Всего может быть четыре вида операций: +, -, *, /.
 2) Создайте константу типа Operation и инициализируйте ей произвольное значение, к примеру (3.1, 33, "+")
 3) Используя конструкцию switch-case вычислите значение операции, указанной в элементе для операндов operandOne и operandTwo. Оператор switch должен корректно отрабатывать любую из четырех операций.
 4) Проверьте правильность работы конструкции по для следующих операций:

 (3.1, 33, "+")
 (24.9, 22.32, "*")
 (11.3, 5, "/")
 (5, 2.5, "-")
 */

typealias Operation = (opaerandOne: Double, operandTwo: Double, operation: Character)
var someOparation: Operation = (3.1, 33, "+")
someOparation = (24.9, 22.32, "*")
someOparation = (11.3, 5, "/")
someOparation = (5, 0, "/")
let resultOperation: Double

switch someOparation {
case let (a, b, "+"):
    resultOperation = a + b
case let (a, b, "-"):
    resultOperation = a - b
case let (a, b, "*"):
    resultOperation = a * b
case (_, 0, "/"):
    print("На ноль делить нельзя")
    resultOperation = 0
case let (a, b, "/") where b == 0:
    resultOperation = a / b
default:
    resultOperation = 0
}

print("Equal = \(someOparation.opaerandOne) \(someOparation.operation) \(someOparation.operandTwo) = \(resultOperation)")





//: [Next](@next)
