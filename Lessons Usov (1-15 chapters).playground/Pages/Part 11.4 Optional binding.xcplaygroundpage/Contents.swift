//: [Previous](@previous)

import Foundation

// В ходе проверке на наличие значение в опционале существет возможность одновременного извлечения значения (если оно не nil) и инициализации его во временную константу или переменную. Этот способ называется Optional binding (привязка опционала) и является наиболее корректным способом работы с опционалами

/*
 синтаксис
 if let временная константа или переменная = Optional {
    // тело оператора
 }
 */

var userLogin: String? = "Vasiliy"
//userLogin = nil

if let userName = userLogin {
    print("name = \(userName)")
    type(of: userName)
} else {
    print("mistake")
}

var pointX: Int? = 10
var pointY: Int? = 2

if let _ = pointX, let _ = pointY {
    print("точка установлена на плоскости")
}

















//: [Next](@next)
