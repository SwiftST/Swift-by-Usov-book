import UIKit

var greeting = "Hello, playground"

UnicodeScalar("a")
UnicodeScalar("1")
UnicodeScalar("B")

//let a = 1...10

/*
 Задание 1

 Покажите два способа создания диапазона, который содержит все целые числа от 1 до 9

*/

var rangeOne = 1...9
var rangeTwo = 1..<10


/*
 Задание 2

 Будет ли корректно выполнен следующий код? Как исправить код, если он работает некорректно?

 var range = "a"..."z"
 rangeTwo = "1"..."y"
 range = rangeTwo
*/

var range = "a"..."z"
var rangeTwo1 = "1"..."y"
range = rangeTwo1

/*
 Задание 3

 Определите тип данных, которые будут иметь объявленные параметры

 var range = 1..<10
 var range2 = 1..
 var range3 = ..<5
 var range4 = -100...100
*/

var range1 = 1..<10 // Range<Int>
var range2 = 1... // PartialRangeFrom<Int>
var range3 = ..<5 // PartialRangeUpTo<Int>
var range4 = -100...100 // ClosedRange<Int>
var range5 = ...5 // PartialRangeThrough<Int>

/*
 Задание 4

 Каким будет значение первого элемента диапазона, хранящегося в переменной range?

 var range = ..<UInt8(10)
*/

var range6 = ..<UInt8(10)
// первое значение заранее неизвестно

/*
 Задание 5

 Какие значения примут параметры comparable и comparable2?

 var a = 1...2
 var b = 2...3
 let comparable = a == b
 let comparable2 = a < b
*/
var a = 1...2
var b = 2...3
let comparable = a == b // false
//let comparable2 = a < b // mistake диапазоны не относятся к протоколы Comparable



/*
 Задание 6

 Создайте диапазон целых чисел от -100 до 100 и инициализируйте его константе range
 Создайте переменную item типа UInt со значением 21.
 Создайте переменную типа Bool и запишите в нее результат проверки наличия значения переменной item в диапазоне range. Каким образом произвести данную проверку?
*/

let range7 = -100...100
var item: UInt = 21
range7.contains(Int(item))

/*
 
 Задание 7

 Создайте диапазон, содержащий все заглавные латинские символы.
 Какими будут значения методов min() и max() для этого диапазона?
 Какими будут значения свойств lowerBound и upperBound для этого диапазона?
*/

var alphabet = "A"..."Z"

//Какими будут значения методов min() и max() для этого диапазона? - Применяются только для целочисленных диапазонов

alphabet.lowerBound
alphabet.upperBound


/*
 Задание 8

 Покажите два способа создания диапазона значений типа Float. В обоих способах должен использоваться оператор ...
 */

var rangeFloat: ClosedRange<Float> = 1.2...2.3
//var rangeFloatOne
var rangeFloatOne =  ClosedRange<Float>(uncheckedBounds: (lower: 1.1, upper: 2.2))
var rangeFloatThree = Float(0)...2.1
