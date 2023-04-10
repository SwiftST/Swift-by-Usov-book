//: [Previous](@previous)

import Foundation

/*
 Задание 1

 1) Создайте переменную типа String со значением «Swift»
 2) Создайте константу типа Character с произвольным значением
 3) Создайте массив в соответсвии со следующими требованиями:
 — количество элементов должно соответствовать количеству символов
 — значения элементов должны быть такими же, как у константы из пункта 2
 — тип массива должен быть Array<String>
 4) Проиницилизируйте значение константы из пункта 2 в переменную из пункта 1
*/
var swift = "Swift"
let char: Character = "a"
var strings = Array(repeating: String(char), count: swift.count)
swift = String(char)


/*
 Задание 2

 1) Создайте константу со строковым значением "JonhWick"
 2) Получите индекс первого символа строки.
 Используя полученный индекс выведите на консоль первый символ строки из пункта 1
 3) Одним выражением получите индекс последнего символа строки из пункта 1
 Используя полученный индекс выведите на консоль последний символ строки из пункта 1
 4) Запишите в новую константу первые четыре символа из строки "БабаЯга"
 Какой тип данных будет у созданной константы
*/
let name = "JonhWick"
let index = name.startIndex
print(name[index])
name.endIndex
print(name[name.index(before: name.endIndex)])

let nameBaba = "БабаЯга"
let newString = nameBaba[nameBaba.startIndex...nameBaba.index(nameBaba.startIndex, offsetBy: 3)]
type(of: newString)

/*
 Задание 3

 Самостоятельно в сети Интернет найдите кодовые точки для Unicode-символов «шахматные фигуры», после чего создайте два множества типа Set<Character>, состоящие из данных символов.
 Первое множество должно содержать все фигуры черного цвета, а второе — белого.
 */

var blackFigures: Set<Character> = []
var whiteFigures: Set<Character> = []

for i in 9812...9817 {
    whiteFigures.insert(Character(UnicodeScalar(i)!))
    blackFigures.insert(Character(UnicodeScalar(i + 6)!))
}
blackFigures
whiteFigures


//UnicodeScalar(9812)
//let someString = String(
//for i in 9812...9817 {
//
//}


//: [Next](@next)
