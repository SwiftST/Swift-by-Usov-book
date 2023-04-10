//: [Previous](@previous)

import Foundation

/*
 Задание 1

 Какие из выражений не вызовут ошибок и вернут множество (т.е. функция type(of:) должна вернуть Set)

 var set1 = [1, 2, 3, 4, 5] // массив
 var set2: Set = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0] // Set<Int>
 var set3: Set = ["a","c"] // Set<String>
 var set4 = Set(arrayLiteral: -0, +0, 1, 2, 3) // Set<Int>
 var set5 = Set(arrayLiteral: 0, 1, 2, 3, 4) // Set<Int>
 */



/*
 Задание 2

 Что будет выведено на консоль в результате выполнения кода?

 var mySet:Set = [] // ошибка не указан явно тип множества
 mySet.insert(13.4)
 print( type (of: mySet.count ) ) // Int
*/
var mySet: Set<Double> = [] // ошибка не указан явно тип множества
mySet.insert(13.4)
print( type (of: mySet.count ) )

/*
 Задание 3
 Что будет выведено на консоль в результате выполнения кода?

 var mySet2: Set = [13.4, 15.1]
 print( mySet2.contains( Double(13.4) ) ) // true
 */
var mySet2: Set = [13.4, 15.1]
print( mySet2.contains( Double(13.4) ) )

/*
 Задание 4

 Какой тип будут иметь созданные множества и их элементы (что вернет функция type(of:) для созданных множеств)?

 var setA: Set = [1, 2, 3, 4, 5] // Set<Int>
 var setB = Set( arrayLiteral: 1, 2, 3, 4, 5 ) // Set<Int>
*/
var setA: Set = [1, 2, 3, 4, 5] // Set<Int>
var setB = Set( arrayLiteral: 1, 2, 3, 4, 5 ) // Set<Int>


/*
 Задание 5

 Какие элементы будут содержаться в множестве resultSet в конце листинга?

 var setOne: Set = [0, 1, 2, 3]
 var setTwo: Set = [0, 2, 4, 6]
 var resultSet = setOne.union(setTwo)
 resultSet.remove(4)
 Правильный ответ: [0, 1, 2, 3, 6]
 
*/


/*
 Задание 6

 1) Объявите множество taskSet1, состоящий из всех целочисленных элементов от 1 до 10
 2) Объявите множество taskSet2, состоящий из всех целочисленных элементов от 5 до 15
 3) Создайте множество taskSet3, состоящий из элементов, которые входят и в taskSet1, и в taskSet2
 4) Создайте множество taskSet4, состоящий из элементов, которые не пересекаются в taskSet1 и taskSet2
 5) Запишите в переменную count типа UInt8 количество элементов в массиве taskSet4. Какое значение примет эта переменная?
 */

let taskSet1 = Set(1...10)
let taskSet2 = Set(5...15)
let taskSet3 = taskSet1.intersection(taskSet2)
let taskSet4 = taskSet1.symmetricDifference(taskSet2)
var count = UInt8(taskSet4.count)


//: [Next](@next)
