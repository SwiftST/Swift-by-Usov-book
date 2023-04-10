//: [Previous](@previous)

import Foundation

/*
 Задание 1

 В результате каких из выражений будет создан словарь? Какой тип данных будет у созданных параметров?

 var dict1: Dictionary = ["One":(100,101),"Two":(200,201)] // Dictionary<String, (Int, Int)>
 var dict2: Dictionary = [(1,2,3):1, (2,3,4):2] // mistake Тип ключа не поддерживает проток Hashable
 var dict3: Dictionary<Int,Int> = [1:13.3, 2:14.1, 3: 16.9] // не соответствие типа данных
 var dict4 = Dictionary(uniqueKeysWithValues: [(1,2), (3,4), (5,6)]) // Dictionary<Int, Int>
 var dict5 = ["Alex": 1989, "John": 2002, "Harold": 1951] // Dictionary<String, Int>
 var dict6: Dictionary = [1, 2, 3, 4] // Mistake
*/
var dict1: Dictionary = ["One":(100,101),"Two":(200,201)] // Dictionary<String, (Int, Int)>
//var dict2: Dictionary = [(1,2,3):1, (2,3,4):2] // mistake Тип ключа не поддерживает проток Hashable
//var dict3: Dictionary<Int,Int> = [1:13.3, 2:14.1, 3: 16.9] // не соответствие типа данных
var dict4 = Dictionary(uniqueKeysWithValues: [(1,2), (3,4), (5,6)]) // Dictionary<Int, Int>
var dict5 = ["Alex": 1989, "John": 2002, "Harold": 1951] // Dictionary<String, Int>
//var dict6: Dictionary = [1, 2, 3, 4] // Mistake





/*
 Задание 2

 1) Какой тип будет иметь словарь, ключи элементов которого будут строковыми значениями (String), а значения элементов — символьными (Character)
// Dictionary<String, Character>
 2) Покажите все известные вам способы создания словаря такого типа. Экспериментируйте, вполне вероятно мы с вами можем ответить на данный вопрос разными способами.
*/

var stringDict: [String: Character] = [
    "aadd": "a"
]
var stringDict1: Dictionary<String, Character> = [
    "122": "1"
]
var stringDict2 = [
    "aa": Character("1"),
    "aaa": "2"
]
stringDict2["aa"]
var stringDict3 = Dictionary(dictionaryLiteral: ("a", Character("a")))


/*
 Задание 3

 Какое значение будет у переменной result?

 var myArray1: Array<UInt> = [1,2,3,4,5]
 var myDict1 = [1:2, 3:4, 5:6]
 var result = myArray1.count + Int(myArray1[3]) + myDict1.count // 5 + 4 + 3 = 12
 */


/*
 Задание 4

 1) Создайте словарь типа Dictionary<Int, String> и наполните его тремя элементами
 2) Запишите в множество все ключи словаря
 3) Запишите в массив все значения словаря
 4) Создайте множество, состоящее из всех значений коллекций из пунктов 2 и 3
 Будьте очень внимательны при решении заданий

 */

var someDictionary = [
    10: "a",
    5: "b",
    7: "c"
]
var someSet = Set(someDictionary.keys)
var someArray = Array(someDictionary.values)
var result: Set<[Int: String]> = []
for (index, value)  in someSet.enumerated() {
    result.insert([value : someArray[index]])
}
result



/*

 Задание 5

 1) Создайте словарь типа Dictionary<Int, Array<String>> и наполните его произвольными значениями
 2) Запишите в константу dictElCount количество элементов в словаре
 3) Создайте массив, состоящий из dictElCount одинаковых элементов, значений которых dictElCount. Какой тип данных будет у созданного массива?

 */

var dictionary = [
    10: ["aa", "aas"],
    11: ["1"],
    12: ["123", "dd"]
]
let dictElCount = dictionary.count
let array = Array(repeating: dictElCount, count: dictElCount)
type(of: array) // [Int]





//: [Next](@next)
