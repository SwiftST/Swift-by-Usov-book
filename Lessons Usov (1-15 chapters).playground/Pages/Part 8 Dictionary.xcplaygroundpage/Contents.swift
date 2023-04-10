//: [Previous](@previous)

import Foundation

// Dictionary - неупорядоченная коллекция элементов для доступа к значениям которой используются ключи. Все ключи словаря имеют один тип данных (должен соответствовать протоколу Hashable) и должны быть уникальными. Значения - не уникальные имеют один тип данных

let dictionary = [
    "1": "one",
    "2": "two",
    "3": "three"
]
dictionary

// Cоздание словаря с помощью Dictionary(dictionaryLiteral: (key1, value1), (key2, value2), ... (keyN, valueN))
let someDictionary = Dictionary(dictionaryLiteral: ("1", "one"), ("2", "two"))
someDictionary

// Создание словаря с помощью Dictionary(uniqueKeysWithValues:)

let baseCollection = [(2, 5), (3, 6), (1, 4)]
let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)
newDictionary

// пример создания с функцией zip(_:_:)

let nearestStarNames = ["Proxia Centauri", "Alpha Centaurri A", "Alpha Centauri B"]
let nearestStarDistances = [4.24, 4.37, 4.37]
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(nearestStarNames, nearestStarDistances))
starDistanceDict

// Тип данных словаря
let codeDesc = [
    200: "success",
    300: "warning",
    400: "Error"
]
type(of: codeDesc)

let dictOne: Dictionary<Int, Bool> = [
    100: false,
    200: true,
    400: true
]
let dictTwo: [String: String] = [
    "John": "Dave",
    "Eleonor": "Green"
]

var coutryDict = [
    "Rus": "Россия",
    "bel": "Белоруссия",
    "ukr": "Украина"
]
coutryDict["Rus"] = "Российская империя"

var oldValueOne = coutryDict.updateValue("Республика Беларусь", forKey: "bel")
oldValueOne
var oldValueTwo = coutryDict.updateValue("Эстония", forKey: "EST")

// Добавление нового элемента
coutryDict["TUR"] = "Турция"
coutryDict

// Для удаления элемента дстаточно присвоить ему nil или удалить через иетод removeValue(forKey:)

coutryDict["TUR"] = nil
coutryDict.removeValue(forKey: "bel")
coutryDict["p"]

// любое возвращенное словарем значение - опционал
let someValue = coutryDict.removeValue(forKey: "1")

// Создание пустого массива
let emptyArray: [Int: String] = [:]
emptyArray
let anotherEmptyArray = Dictionary<String, Int>()
anotherEmptyArray

var birthYears = [
    1988: ["John", "lian"],
    1990: ["Pavel", "Ivan"]
]
birthYears
birthYears = [:]

// Базовые свойства и методы словарей
var someDict = [
    0: "2",
    1: "3",
    2: "4"
]
someDict.count
someDict = [:]
someDict.isEmpty

let keys = coutryDict.keys
type(of: keys)
let values = coutryDict.values
type(of: values)

var setKeys = Set(keys)
var arrayValues = Array(values)




//: [Next](@next)
