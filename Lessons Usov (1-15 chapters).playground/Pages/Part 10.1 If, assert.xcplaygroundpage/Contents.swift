//: [Previous](@previous)

import Foundation

// Утверждения (assertions) - позволяет прервать выполнение программы (аварийное завершение программы), когда некоторое условие не выполняется. Утверждения в Swift реализованы в виде глобальной функции assert(_:_:)
// В основном утверждения используются для отладки и тестирования разрабатываемых программ

// assert(проверяемое выражение, отладочное сообщение)

let strName = "Dragon"
let strYoung = "young"
let strOld = "old"
let strEmpty = " "

var dragonAge = 225
assert(dragonAge <= 235, strName + strEmpty + strOld)
assert(dragonAge >= 225, strName + strEmpty + strYoung)
print("Program success")

// Оператор условия if

var tenantCount = 6 // количество жильцов
var rentPrice: Int

if tenantCount < 5 {
    rentPrice = 1000
} else if tenantCount >= 5 && tenantCount <= 7 {
    rentPrice = 800
} else {
    rentPrice = 500
}

var allPrice = tenantCount * rentPrice

if ..<5 ~= tenantCount {
    rentPrice = 1000
} else if 5...7 ~= tenantCount {
    rentPrice = 800
} else {
    rentPrice = 500
}

if (..<5).contains(tenantCount) {
    rentPrice = 1000
} else if (5...7).contains(tenantCount) {
    rentPrice = 800
} else {
    rentPrice = 500
}

// тернарный оператор

let x = 77
let y = x > 70 ? 100 : 50

let a = Int.random(in: 1...100)
let b = Int.random(in: 1...100)

// Var 1 with &&
if a > 50 && b > 50 {
    print("A and B more 50")
}

// Var 2 with ,
if a > 50, b > 50 {
    print("A and B more 50")
}

// запятая по своей логике то же самое что &&, вычесление проводится по порядку и если одно из выражений false то последующие подвыражения вычисляться не будут

if let a = Int("1"), let b = Int("333"), a < b {
    print("a < b")
}





//: [Next](@next)
