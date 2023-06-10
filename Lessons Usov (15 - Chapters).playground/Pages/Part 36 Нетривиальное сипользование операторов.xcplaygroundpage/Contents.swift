//: [Previous](@previous)

import Foundation

// Операторные функции
// С помощью операторных функций возможно обеспечить взаимодействие собственных объектных типов посредством стандартных операторов Swift

// структура описывающая вектор на плоскости
struct Vector2D {
    var x = 0.0, y = 0.0
}

// собственная реализация оператора сложения (+)
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// операторная функция определаены с именем, соответствующим оператору сложения. Так как оператор сложения бинарный - он должен принимать два значения и возвращать результат сложения
// ситуация когда несколько объектов имеют одно и то же имя называется перегрузкой (overloading)


// Префиксные и постфиксные операторы
// Для перегрузки префиксного или постфиксного оператора перед объявлением операторной функции необходимо указать модификатор prefix или postfix

// реализация префиксного унарного минуса структуры Vector2D
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}
let positive = Vector2D(x: 3.0, y: 4)
let negative = -positive

// Составной оператор присваивания
// В составных операторах присваивания оператор присваивания (=) комбинируется с другим оператором. Для перегрузки составных операторов в операторной функции первый передаваемый аргумент необходимо сделать сквозным (inout), так как именно его значение будет меняться в ходе выполнения функции.

// example
func += (left: inout Vector2D, right: Vector2D) {
    left = left + right
}
var original = Vector2D(x: 1, y: 2)
let vectorToAdd = Vector2D(x: 3, y: 4)
original += vectorToAdd

// Оператор эквивалентности

func == (left: Vector2D, right: Vector2D) -> Bool {
    return left.x == right.x && left.y == right.y
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}
let twoThree = Vector2D(x: 2, y: 3)
let anotherTwoThree = Vector2D(x: 2, y: 3)
if twoThree == anotherTwoThree {
    print("Эти два вектора эквивалентны")
}

// Пользовательские операторы
// В дополнении к стандартным операторам Swift можно определять собственные. Собственные операторы определяются с помощью ключевого слова operator и модификаторов prefix, infix, postfix, причем вначале необходимо объявить новый операттор, а уже потом задавать его новую реализацию в виде операторной функции

// example
prefix operator +++
prefix func +++ (vector: inout Vector2D) {
    vector += vector
}
var toBeDoubled = Vector2D(x: 1, y: 4)
+++toBeDoubled
toBeDoubled

//: [Next](@next)
