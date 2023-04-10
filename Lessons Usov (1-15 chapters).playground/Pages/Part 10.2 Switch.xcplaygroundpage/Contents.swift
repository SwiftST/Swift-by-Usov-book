//: [Previous](@previous)

import Foundation

// Операторор ветвления Switch

var userMark = 4

if userMark == 1 {
    print("1")
} else if userMark == 2 {
    print("2")
} else if userMark == 3 {
    print("3")
} else if userMark == 4 {
    print("4")
} else if userMark == 5 {
    print("5")
} else {
    print("incorrect user mark")
}

let message: String
switch userMark {
case 1:
    message = "1"
case 2:
    message = "2"
case 3:
    message = "3"
case 4:
    message = "4"
case 5:
    message = "5"
default:
    message = "incorrect value"
}
print(message)

// диапазоны в опреаторе switch

switch userMark {
case 1..<3:
    print("Экзамен сдан")
case 3:
    print("Удовлетворительно")
case 4, 5:
    print("Экзамен сдан")
default:
    assert(false, "incorrect value")
}

let answer: (code: Int, message: String) = (390, "Page not found")

switch answer {
case (100..<400, _):
    print(answer.message)
case (400...499, _):
    assert(false, "fatal error pzda")
default:
    print("Incorrect answer")
}

/*
Вы — владелец трех вольеров для драконов. Каждый вольер предназначен для содержания драконов с определенными характеристиками:
Вольер 1 — для зеленых драконов с массой менее двух тонн.
Вольер 2 — для красных драконов с массой менее двух тонн.
Вольер 3 — для зеленых и красных драконов с массой более двух тонн.
*/

let dragon: (color: String, weight: Double) = ("Red", 2)
var aviary: (one: Int, two: Int, three: Int) = (0, 0, 4)

switch dragon {
case ("Green", 0..<2):
    aviary.one += 1
case ("Red", 0..<2):
    aviary.two += 1
case ("Red", 2...), ("Green", 2...):
    aviary.three += 1
default:
    print("Dragon leave")
}
aviary

// коючевое слово where - это дополнительное условие, которое можно записать в case блоках. Where указывается для каждого условия отдельно


switch dragon {
case ("Green", 0..<2):
    aviary.one += 1
case ("Red", 0..<2):
    aviary.two += 1
case ("Red", 2...) where aviary.three < 5, ("Green", 2...) where aviary.three < 5:
    aviary.three += 1
default:
    print("Dragon leave")
    
}
aviary

// Связывание значений

// условие: вольер No 3 может принять только тех драконов, чей вес без остатка делится на единицу

switch dragon {
case ("Green", 0..<2):
    aviary.one += 1
case ("Red", 0..<2):
    aviary.two += 1
case ("Red", 2...) where aviary.three < 5 && dragon.weight.truncatingRemainder(dividingBy: 1) == 0,
    ("Green", 2...) where dragon.weight < 5 && dragon.weight.truncatingRemainder(dividingBy: 1) == 0:
    aviary.three += 1
default:
    print("Dragon leave")
}

switch dragon {
case ("Green", 0..<2):
    aviary.one += 1
case ("Red", 0..<2):
    aviary.two += 1
case let (color, weight) where (color == "Green" || color == "Red") && aviary.three < 5 && weight.truncatingRemainder(dividingBy: 1) == 0:
    aviary.three += 1
default:
    print("Dragon leave")
}

// оператор break в конструкции switch-case - прекращает исполнение кода инструкции switch

let someInt = 0
switch someInt {
case 1...:
    print("Больше 0")
case ..<0:
    print("Меньше 0")
default:
    break
}

// Ключевое слово fallthrough - при выполнение условия case в теле которого будет оператор, программа автоматически перейдет к следующему блоку

/*
 представьте, что существует три уровня готов- ности к чрезвычайным ситуациям: А, Б и В. Каждая степень предусматривает выполнение ряда мероприятий, причем каждый последующий уровень включает в себя мероприятия предыдущих уровней. Минимальный уровень — это В, мак- симальный — А (включает в себя мероприятия уровней В и Б).
 */

var level = "b"

switch level {
case "a":
    print("Level А")
    fallthrough
case "b":
    print("Level B")
    fallthrough
case "c":
    print("Level C")
default:
    break
}





//: [Next](@next)
