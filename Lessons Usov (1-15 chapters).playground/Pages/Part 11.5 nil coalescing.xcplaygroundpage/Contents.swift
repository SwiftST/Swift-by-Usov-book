//: [Previous](@previous)

import Foundation

// Оператор объединения с nil

// Еще один способ извлечения опционала известен как операция объединения с nil (nil coalescing). C помощью оператора ?? возвращается либо значение опционала либо значение по умолчанию

/*
 синтаксис
 let name_parametr = name_optional ?? default_value
 */
// вместо let может быть использован var

var optionalInt: Int? = 20
var mustHaveResult = optionalInt ?? 0
mustHaveResult

// код ниже эквивалентен примеру выше
var optionalInteger: Int? = 20
var mustHaveResults: Int

if let someValue = optionalInteger {
    mustHaveResults = someValue
} else {
    mustHaveResults = 0
}
mustHaveResults



//: [Next](@next)
