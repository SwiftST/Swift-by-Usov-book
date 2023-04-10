//: [Previous](@previous)

import Foundation

let myProgramStatus = (200, "In work", true)
myProgramStatus

let tuple1 = (true, "On work", 200)

print(type(of: myProgramStatus) == type(of: tuple1))

let floatStatus: (Float, String, Bool) = (200, "In work", true)
floatStatus

typealias NumberType = Int
let numbersTuple: (Int, Int, NumberType, NumberType) = (0, 1, 2, 3)
numbersTuple

let (statusCode, statusText, statusConnect) = myProgramStatus
print("Код ответа - \(statusCode)")
print("Текст ответа - \(statusText)")
print("Связь с сервером - \(statusConnect)")

var (myName, myAge) = ("Троль", 140)
print("Мое имя \(myName), и мне \(myAge) лет")

let (statusCode1, _, _) = myProgramStatus

print("Код ответа - \(myProgramStatus.0)")
print("Текст ответа - \(myProgramStatus.1)")
print("Связь с сервером - \(myProgramStatus.2)")


let statusTuple = (statusCode: 200, statusText: "In work", statusConnect: true)

print("Код ответа - \(statusTuple.statusCode)")
print("Текст ответа - \(statusTuple.statusText)")
print("Связь с сервером - \(statusTuple.2)")

let anotherStatusTuple: (statusCode: Int, stausText: String, statusConnect: Bool) = (200, "In work", true)
anotherStatusTuple.statusCode

// Редактирование кортежа

var myFirstTuple: (Int, String) = (0, "0")
let mySecondTuple = (100, "Код")
myFirstTuple = mySecondTuple
mySecondTuple

var someTuple = (200, true)
someTuple.0 = 404
someTuple.1 = false

// сравнение кортежей

(3, "alpha") < (2, "beta")
(4, "beta") > (4, "gamma")
(3.14, "pi") == (3.14, "pi")

//: [Next](@next)
