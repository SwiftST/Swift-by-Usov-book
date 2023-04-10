//: [Previous](@previous)

import Foundation

// Set - неупорядоченная коллекция уникальных значений. Элементы множества должны соответствовать протоколу Hashable

// создание множества

// 1 var
let setOne: Set<Int> = [1, 2, 6]

// 2 var
let setTwo: Set = [1, 55, 3]

// 3 var
let setThree = Set<Int>(arrayLiteral: 1, 3, 566)

// 4 var
let setFour = Set(arrayLiteral: 1, 33, 22)

// Empty set

var emptySet = Set<String>()

var emptySetOne: Set<Int> = []

// Основные методы множеств

var musicStyleSet: Set<String> = []
musicStyleSet.insert("Jazz")
musicStyleSet
musicStyleSet.insert("Hip-Hop")
musicStyleSet.insert("Rock")

var djdjd = musicStyleSet.remove("Classic")
musicStyleSet.removeAll()

musicStyleSet = ["Hip-Hop", "Jazz", "Classic", "Rock"]
musicStyleSet.contains("Jazz")
musicStyleSet.contains("Pop")

musicStyleSet.count

// Операции со множествами

// odd
let oddDigits: Set = [1, 3, 5, 7, 9]

//even
let evenDigits: Set = [0, 2, 4, 6, 8]

//different
let differentDigits: Set = [3, 4, 7, 8]


// Создание множества из общих значений двух множеств
differentDigits.intersection(oddDigits)

// Для получения всех непересекающихся значений используется symmetricDifference
differentDigits.symmetricDifference(oddDigits)

// Создания множества из всех элементов обоих множеств
let union = differentDigits.union(oddDigits)

// Возвращает все элементы первого множкства котторые не входят во второе
let subtract = differentDigits.subtracting(evenDigits)


// Отношение множеств

let aSet: Set = [1, 2, 3, 4, 5]
let bSet: Set = [1, 3]
let cSet: Set = [5, 6, 7, 8]

// bSet - явояется подмножеством aSet
// cSet - пересекается с aSet, c bSet это множество не перескается

let copyOfBSet = bSet
bSet == copyOfBSet

// isSubset - опредеят является ли множество подмножеством (если множества равны вернет true)
bSet.isSubset(of: aSet)

// isSuperset - определяет является ли множество надмножеством (если множества равны вернет true)
aSet.isSuperset(of: bSet)

// isDsjoint - определяет нет ли в множествах оющих элементов (если нет вернет true)
cSet.isDisjoint(with: bSet)

// isStrictSubset - определяет является ли множество подмножеством не равным указанному множеству
bSet.isStrictSubset(of: aSet)

// isStrictSuperSet - определяет является ли множество надмножеством не равным указанному множеству
aSet.isStrictSuperset(of: bSet)

let setOfNums: Set = [1, 10, 2, 5, 12, 23]
let sortedArray = setOfNums.sorted()
sortedArray
type(of: sortedArray)

//: [Next](@next)
