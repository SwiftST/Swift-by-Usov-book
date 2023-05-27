//: [Previous](@previous)

import Foundation

// Опциональные цепочки

class Person {
    // Резиденция данной первсоны
    var residence: Residence?
}

// свойство residence может содержать значения типа Residence а может не содержать его так как это опционал

class Residence {
    // количество комнат в резиденции
    var rooms: [Room]?
    
    func roomsCount() -> Int {
        if let rooms = self.rooms {
            return rooms.count
        } else {
            return 1
        }
    }
}

struct Room {
    // площадь комнаты
    let square: Int
}

// для доступу к значению типа Room
// необходимо выполнить два опциональных связывания
var man = Person()
man.residence = Residence()

if let resedence = man.residence {
    if let rooms = resedence.rooms {
        // действия с коллекцией [Room]
    } else {
        print("room is nil")
    }
} else {
    print("residence is nil")
}

// создаем объект комната
let room = Room(square: 10)
// создаем объект место проживания
var residence = Residence()
// добавляем в него комнату
residence.rooms = [room]
// создаем обект персона
var manOne = Person()
// добавляем в него резиденцию
manOne.residence = residence
// получаем доступ к комнатам с помощью опциональной цепочки
if let rooms = manOne.residence?.rooms {
    // действия с коллекцией типа [Room]
    rooms.isEmpty
}

// опциональные цепочки используются для вызова свойств, методов и сабскриптов любого уровня вложенности

// example
// man.residence?.kitchen?.table?.move()

// Установка значений через опциональные цепочки
// Использование опциональных цепочек не ограничивается получением доступа к свойствам и методам. Они так же могут использоваться для инициализации значений

// example
let roomOne = Room(square: 11)
let roomTwo = Room(square: 20)

//manOne.residence = nil
manOne.residence?.rooms = [roomOne, roomTwo]
manOne.residence?.rooms
manOne.residence?.roomsCount()

// Если при доступе к свойству rooms значение свойства residence будет nil, программа не вызовет ошибку, а только не выполнит операцию инициализации


// Доступ к сабскриптам через опциональные цепочки

let firstRoom = manOne.residence?.rooms?[0]
type(of: firstRoom)

// такой доступ можно использовать и для инициализации значений

manOne.residence?.rooms?[0] = Room(square: 35)
manOne.residence?.rooms?[0].square





//: [Next](@next)
