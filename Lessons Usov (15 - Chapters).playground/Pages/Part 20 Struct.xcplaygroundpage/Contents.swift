//: [Previous](@previous)

import Foundation

struct ChessPlayer { }

var exam = ChessPlayer()
type(of: exam)


// свойчтва структуры

struct Gamer {
    var name: String
    var victories: Int
}

// структуры имеют встроеннный инициализатор (метод с именем init)

let playerHarry = Gamer.init(name: "Harry", victories: 1)

// имя инициализатора может быть опущено

var harry = Gamer(name: "Harry", victories: 2)

// свойтва по умолчанию

struct Driver {
    var name: String
    var age: UInt = 0
}

let driverAlex = Driver(name: "Alex")

struct DriverOne {
    var name: String = "Driver"
    var age: UInt = 0
}

let someDriver = DriverOne()
someDriver.name
someDriver.age

// Cобственные инициализаторы
// когда мы создаем свой инициализатор, то лишаемся встроенного

struct SomeDriver {
    var name: String = "Driver"
    var age: Int = 0
    // инициализвтор
    init(name: String) {
        self.name = name
    }
}

var driverBob = SomeDriver(name: "Bob")

// код вызовет ошибку, так как у нас больше нет встроенного инициализатора
//var newDriver = SomeDriver()

// Если экзкмляр структуры хранится в константе то модификация его свойств невозможна, если он хранится в переменнной то возможно модифицировать только те свойста которые в самой структуре объявлены как var
// Структуры - Type Values при передаче одного экземпляра структуры другому происходит копирование


// методы в структурах

struct Player {
    var name: String = "Player"
    var victories: UInt = 0
    init(name: String) {
        self.name = name
    }
    // method
    func description() {
        print("Player \(name) have \(victories) ")
    }
}

var andrey = Player(name: "Andrey")
andrey.description()

// Изменяющие методы
// по умолчанию методы структур не могут изменять значения свойств, объявленные в тех же самых структурах. Чтобы обойти данный запрет перед именем метода необходимо указать mutating

struct SomePlayer {
    var name: String = "Player"
    var victories: UInt = 0
    init(name: String) {
        self.name = name
    }
    // method
    func description() {
        print("Player \(name) have \(victories) ")
    }
    mutating func addVictiories( count: UInt = 1 ) {
        victories += count
    }
}

//: [Next](@next)
