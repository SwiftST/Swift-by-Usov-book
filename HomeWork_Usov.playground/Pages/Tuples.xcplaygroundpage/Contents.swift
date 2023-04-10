//: [Previous](@previous)

import Foundation

/*
 Задание 1
 Объявите константу и запишите в нее свое имя.
 Объявите переменную типа UInt8 и запишите в нее свой возраст.
 Объявите кортеж и явно определите его тип данных, как (name: String, age: Int).
 В первый элемент кортежа запишите значение константы с именем.
 Во второй элемент кортежа запишите значение из переменной с вашим возрастом.
*/
let name = "Pavel"
var age: UInt8 = 32
var person: (name: String, age: Int)
person.name = name
person.age = Int(age)


/*
 Задание 2

 Объявите кортеж, способный хранить три значения типа Int16.
 Одним выражением объявите две константы типа Int и проинициализуйте им произвольные значения.
 В первые два значения кортежа запишите значения из данных переменных, а в третий их сумму.
 */

let someTuple: (Int16, Int16, Int16)
let a = 23, b = 55
someTuple = (Int16(a), Int16(b), Int16(a + b))

/*
 Задание 3
 Будет ли корректно выполнен следующий код? Как исправить код, если он работает некорректно?

 var someTuple = (myName: "Alex", myAge: 12, "Russia")
*/

var someTuple1 = (myName: "Alex", myAge: 12, "Russia")
someTuple1.myAge
someTuple1.myName

/*
 Задание 4
 Будет ли корректно выполнен следующий код? Как исправить код, если он работает некорректно?

 var tupleOne = (first: 1, second: 2)
 var tupleTwo = (3, 4)
 tupleTwo = tupleOne
 tupleTwo.first
*/

var tupleOne = (first: 1, second: 2)
var tupleTwo = (3, 4)
tupleTwo = tupleOne
tupleTwo.0



/*
 Задание 5

 Вам даны две целочисленные переменные со значениями 12 и 21. Поменяйте их значения местами без использования буферной переменной и математических операций.

*/
var valueOne = 12
var valueTwo = 21

(valueOne, valueTwo) = (valueTwo, valueOne)

valueOne
valueTwo


/*
 Задание 6

 1) Создайте кортеж с двумя параметрами: ваш любимый фильм и ваше любимое число. Все элементы кортежа должны быть именованными.
 2) Одним выражением запишите каждый элемент кортежа в две константы. Проверьте значения параметров с помощью вывода в области результатов.
 3) Создайте псевдоним типа, используемого для первого кортежа, назовите его Man. Создайте второй кортеж типа Man, но описывающий другого человека (с другими значениями). Обратите внимание, что элементы кортежа так же должны иметь имена.
 4) Обменяйте значения в кортежах между собой.
 5) Создайте новый кортеж, элементами которого будут любимое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кортежей.
 */

typealias Man = (film: String, number: Int)
var personTuple: Man = (film: "Pokemon", number: 7)
let (film, number) = personTuple
var somePerson: Man = ("Devil may cry", 4)
(personTuple, somePerson) = (somePerson, personTuple)
let resultTuple = (personTuple.number, somePerson.number, personTuple.number - somePerson.number)


//: [Next](@next)
