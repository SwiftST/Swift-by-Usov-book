//: [Previous](@previous)

import Foundation

// Нельзя производить прямые операции между значениями опционального и базоваого типов

let a: Int = 4
let b: Int? = 5
// a + b - Mistake. Несоответствие типов

// Для решения этой проблемы можно применить прием, называемый извлечением опционального значения или другими словами преобразовать опционал в соответствующий ему базовый тип

// Выделяют 3 способыа извлечения опционального значения:
// 1 - принудительное извлечение (force unwrapping)
// 2 - косвенное извлечение (implicitly unwrapping)
// 3 - операция объединения с nil


// 1 - force unwrapping
// преобразует значение опционального типа в значение базового типо с помощью восклицательного знака, указываемого после имени параметра с опциональным значением

var optVar: Int? = 12
var intVar = 34
let result = optVar! + 34

type(of: optVar!)

// Данный метод извлечения применяется, если вы на 100 процентов знаете что в опциональном параметре содержится значение. В противном случае возникнет ошибка при извлечении

optVar = nil
//optVar! + 3 - mistake unwrapping

// Косвенное извлечение значения (implicitly unwrapping)

// Если вы уверены, что в момент проведения операции с опционалом, в нем всегда будет значение (не nil), то при явном указании типа данных знак вопрос может быть заменен на восклицательный знак. При этом все последующие обращения к параметру необходимо производить без принудительного извлечения, так как оно будет происходить автоматически

var wrapDouble: Double! = 12.1
wrapDouble + 1.11
type(of: wrapDouble)


//: [Next](@next)
