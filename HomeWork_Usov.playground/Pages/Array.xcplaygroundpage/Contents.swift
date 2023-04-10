//: [Previous](@previous)

import Foundation

/*
 Задание 1

 Какие из выражений не вызовут ошибок? Исправьте найденные ошибки.

 var arr1 = [1,2,3,"4",5,6]
 var arr2 = ["a","Z"]
 var arr3 = [Character("a"), "b"]
 var arr4 = [Character("a"), "zz"]
 var arr5: [ClosedRange<Float>] = [1...3, 2.1...2.3]
 */
var arr1 = [1, 2, 3, 4, 5, 6] // неверный тип
var arr2 = ["a", "Z"]
var arr3 = [Character("a"), "b"]
var arr4 = [Character("a"), "z"] // убрать лишний символ
var arr5: [ClosedRange<Float>] = [1...3, 2.1...2.3]
/*
 Задание 2

 Покажите все способы создания массива, состоящего из целочисленных элементов от 0 до 10

*/
var closedRange = 1...10
var arrayInt = [Int](1...10)
var arrayIntOne = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var arrayIntTwo = Array<Int>(1...10)
var arrayIntThree: [Int] = Array(closedRange)
var arrayIntFour = Array(closedRange)
var arrayIntFive = Array(stride(from: 1, through: 10, by: 1))

/*
 Задание 3

 Покажите все известные вам способы создания массива, состоящего из пяти одинаковых значений
*/

var tooArray = [5, 5, 5, 5, 5]
var tooArrayOne = Array(repeating: 5, count: 5)
var tooArrayTwo = [Int](repeatElement(5, count: 5))
var tooArrayThree = Array(arrayLiteral: 5, 5, 5, 5, 5)

/*
 Задание 4

 1)Создайте массив, состоящий из четырех целочисленных элементов

 2)Сделайте так, чтобы вместо второго и третьего элементов массива (с индексами 1 и 2) был элемент, содержащий сумму начального и конечного элементов данного массива. После этого в массиве должно остаться 3 элемента.

 3) Отсортируйте элементы по возрастанию
*/
var integers = [1, 4, 5, 2]
integers[1...2] = [integers[0] + integers.last!]
integers
integers = integers.sorted()

/*
 Задание 5

 1) Создайте массив, состоящий из всех целых чисел от 1 до 100

 2) Создайте пустой массив типа Array<Int>

 3) Проинициализируйте пустому массиву элементы с 25го по 50ый

 */

var integersOne = Array(1...100)
integersOne[25]
var emptyInt: [Int]
emptyInt = Array(integersOne[24...49])

/*
 Задание 6

 1) Создайте массив arr из пяти элементов типа Character

 2) В массив arr вставьте вторым элементом (не вместо второго, а между первым и вторым) символ «z»

 3) Создайте переменную i типа UInt8 и проинициализируйте ей количество элементов массива arr.
*/

//var arr: [Character] = ["a", "b", "c", "d", "f"]
//arr.insert("z", at: 1)
//var i = UInt8(arr.count)


/*
 Задание 7

 Каким образом можно получить значение предпоследнего элемента массива независимо от количества элементов в нем.
 Может ли описанный вами синтаксис привести к ошибке? Если да, то в каком случае?

*/

//

//arr[arr.count - 2]
// в случае если массив будет пустой или состоять из одного элемента


/*
 Задание 8

 Определи тип каждого из массивов

 var arr = [1,2,3,4,100] // [Int]
 var arr = [Character("2"), "c","5"] // [Character]
 var arr = [[1...10],[2...8],[3...7]]// [[ClosedRange<Int>]]
 var arr = [1...2, 3...4, 5..<6] // Mistaake 3 element element
 var arr = [1, arr.0 + 1, arr.1 + 1] [Int]
*/

var arrOne = [1,2,3,4,100] // [Int]
var arrOne1 = [Character("2"), "c","5"] // [Character]
var arrOne2 = [[1...10],[2...8],[3...7]]// [[ClosedRange<Int>]]
//var arrOne3 = [1...2, 3...4, 5..<6] // mistake
//var arrOne4 = [1, arrOne.0 + 1, arrOne.1 + 1] // mistake




/*
 Задание 9

 Будет ли корректно выполнен следующий код? Как исправить код, если он работает некорректно?

 Что будет выведено на консоль?

 var arr = [Array<Character>]()
 arr.append(["a", "b", "c"])
 arr.append(["d", "e", "f"])
 arr.remove(at:1)
 var arr2 = arr.remove(at: 0)
 print(arr2[0]) // "a"
*/


var arr = [Array<Character>]()
arr.append(["a", "b", "c"])
arr.append(["d", "e", "f"])
arr.remove(at:1)
var arrTwo = arr.remove(at: 0)
print(arrTwo[0]) // "a"



/*
 Задание 10

 Будет ли корректно выполнен следующий код? Как исправить код, если он работает некорректно?

 var firstArray = [1,2,3,4,5]
 var secondArray: [UInt] = firstArray.dropLast()
 */

// Var 1
var firstArray = [1,2,3,4,5]
var secondArray = firstArray.dropLast()

// Var 2
var anotherSecondArray = firstArray.dropLast().map { UInt($0) }
anotherSecondArray

//: [Next](@next)
