//: [Previous](@previous)

import Foundation

// Опциональный тип данных - подразумевает что параметр либо имеет значение определенного типа, либо вообще не имеет значения (nil)

let possibleString = "1933"
let convertPossibleString = Int(possibleString)
convertPossibleString

let unpossibleString = "dfsddf"
let convertUnpossibleString = Int(unpossibleString)

type(of: convertPossibleString)
type(of: convertUnpossibleString)

// Optional<Int> - это идентификатор целочисленного опционального типа данных
// Опционалы являются самостоятельными типами данных, отличными от базовых

// Optional<T> - полная форма записи
// T? - краткая форма записи

// T: Any - наименование типа данных, на котором основан опционал
// При объявлении параметра имеющего опциональный тип необходимо явно указать его тип данных

let optionalChar: Optional<Character> = "a"
var xCoordinate: Int? = 12
xCoordinate
xCoordinate = nil
xCoordinate

// Если объявить переменную опционального типа, но не проинициализировать ее, по умолчанию она будет nil

var someOptional: Bool?

// Для создания опционала помимо явного указания типа данных можно использовать функцию - Optional(_:)

var optionalVar = Optional(..<1)
optionalVar = nil
type(of: optionalVar)

// Опционалы в кортежах

var tuple: (code: Int, message: String)? = nil
tuple = (404, "page not found")
tuple?.0
tuple?.1

let tupleWithOptional: (Int?, Int) = (nil, 100)
tupleWithOptional.0
tupleWithOptional.1








//: [Next](@next)
