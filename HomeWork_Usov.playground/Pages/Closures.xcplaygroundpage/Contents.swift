//: [Previous](@previous)

import Foundation

/*Задание 1

1)Напишите замыкание, которое производит вывод на консоль сообщения "Hello, World!".
2)Вызовите данное замыкание
3)Какой тип данных у данного замыкания?

*/
var closureHello = {
    print("Hello")
}
closureHello()
// () -> Void
type(of: closureHello)


/*
Задание 2

Из представленных ниже функциональных типов укажите те, которые указывают на то:

1) что функция/замыкание не принимает входных аргументов и ничего не возвращает
2) что функция принимает один входной аргумент
3) что функция возвращает значение

() -> (:)
(_) -> ()
(Int) -> () -> () // 2, 3
() -> Void // 1
() -> (String) // 3
() -> () // 1
*/




/*
Задание 3

1) Напишите замыкание, которое принимает на вход параметр типа String и выводит его значение на консоль.
2) Вызовите данное замыкание
3) Какой тип данных у данного замыкания?

*/

let printText = { (text: String) in
    print(text)
}
printText("Some")
// (String) -> Void
type(of: printText)

/*
Задание 4

1) Напишите замыкание, которое принимает на вход два целочисленных параметра и возвращает их сумму.
2) Протестируйте работу данного замыкания
3) Какой тип данных будет у данного замыкания?

*/

let sumTwoNumbers = { (one: Int, two: Int) in
    one + two
}
sumTwoNumbers(2, 3)
// (Int, Int) -> Int
type(of: sumTwoNumbers)


/*
Задание 5

Каким образом можно упростить данное замыкание?

let someClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}
*/
let someClosure: (Int, Int) -> Int = { $0 * $1 }
//let someClosure = { (a: Int, b: Int) in
//    a * b
//}



/*
Задание 6

1) Напишите замыкание типа (Int, Int) -> Int, которое высчитывает разность двух переданных ему чисел.
2) Напишите функцию, которая принимает на вход два целочисленных параметра, а так же замыкание типа (Int, Int) -> Int. Данное замыкание (третий аргумент функции) должно определять операцию, которая будет производиться в теле функции.
3) Вызовите данную функцию и передайте ей два целых числа, а так же написанное в шаге 1 замыкание.
4) Вызовите данную функцию и передайте ей два целых числа, а так же замыкание, производящее умножение данных чисел. Причем замыкание должно передаваться не через промежуточный параметр-хранилище, а непосредственно в качестве аргумента

*/

var subtraction = { (numOne: Int, numTwo: Int) in
    numOne - numTwo
}
func calculateNumbers(numOne: Int, numTwo: Int, closure: (Int, Int) -> Int) -> Int {
    closure(numOne, numTwo)
}
calculateNumbers(numOne: 1, numTwo: 2, closure: subtraction)
calculateNumbers(numOne: 2, numTwo: 3) { $0 * $1 }

/*
Задание 7

Присутствуют ли в данном коде ошибки?
Если нет, то, что будет выведено на консоль?
Если да, то как их исправить?

func someAction() -> (() -> Int) {
    var currentValue = 0
    return {
        currentValue = currentValue + 1
        return currentValue
    }
}
let increment = someAction()
print(increment())
print(increment())
*/

func someAction() -> (() -> Int) {
    var currentValue = 0
    return {
        currentValue = currentValue + 1
        return currentValue
    }
}
let increment = someAction()
print(increment())
print(increment())



/*
Задание 8

Присутствуют ли в данном коде ошибки? // нет
Если нет, то, что будет выведено на консоль? // 33 и 30
Если да, то как их исправить?
var a = 11
var b = 22
let closure: () -> Int = { return a + b}
print(closure())
a = 10
b = 20
print(closure())
*/

var a = 11
var b = 22
let closure: () -> Int = { return a + b}
print(closure())
a = 10
b = 20
print(closure())




/*
Задание 9

Вам дан массив целочисленных значений
let arrayOfInt = [2,55,1,2,77,24,1,2]
Отсортируйте его элементы по убыванию и выведите на консоль

*/

let arrayOfInt = [2,55,1,2,77,24,1,2]
print(arrayOfInt.sorted(by: > ))




/*
Задание 10

Присутствуют ли в данном коде ошибки? // нет
Если нет, то, что будет выведено на консоль? // массив по убыванию
Если да, то как их исправить?
let arrayIfFloat = [2,4,6.2,11,2,7,6.7] //Double
let sortedArray = arrayIfFloat.sorted() { $0 > $1 }
print(sortedArray)
*/
 
let arrayIfFloat = [2,4,6.2,11,2,7,6.7] //Double
let sortedArray = arrayIfFloat.sorted() { $0 > $1 }
print(sortedArray)
 
let exponentiation = { (numberOne: Int, numberTwo: Int) in
    guard numberOne > 0, numberTwo > 0 else {
        return 0
    }
    if numberTwo == 1 {
        return 1
    }
    var tempNumber = numberOne
    for _ in 2...numberTwo {
        tempNumber *= numberOne
    }
    return tempNumber
}
exponentiation(2, 5)

func anotherExponentiation(_ numberOne: Int, _ numberTwo: Int) -> Int {
    guard numberOne > 0, numberTwo > 0 else {
        return 0
    }
    if numberTwo == 1 {
        return numberOne
    }
    if numberTwo == 2 {
        return numberOne * numberOne
    }
    return numberOne * anotherExponentiation(numberOne, numberTwo - 1)
}
anotherExponentiation(2, 5)
//: [Next](@next)
