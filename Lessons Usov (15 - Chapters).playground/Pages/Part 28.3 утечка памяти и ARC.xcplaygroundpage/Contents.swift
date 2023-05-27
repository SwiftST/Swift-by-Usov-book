//: [Previous](@previous)

import Foundation

// Утечка памяти и ARC
// При утечке памяти Swift неможет принять своевременное решениеоб удалении объектовв в куче. В результате этого в памяти появляются "бесхозные" записи, которые никогда больше не будут использоваться и будут находится там до завершения работы приложения

// Пример утечки памяти
// Создадим ситуацию когда объекты взамино указывают друг на друга (кольцевые ссылки)
class House {
    var title: String
    var owner: Human?
    
    init(title: String, owner: Human? = nil) {
        print("Дом \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом \(title) уничтожен")
    }
}

class Human {
    var name: String
    var houses: [House] = []
    
    init(name: String) {
        print("Owner \(name) created")
        self.name = name
    }
    
    func add(house: House) {
        self.houses.append(house)
    }
    
    deinit {
        print("Owner \(name) kill")
    }
}
// c помощью метода add(house:) мы можем установить дополнительную связь между домом и его владельцем: если раньше главным объектом была сущность "Дом", так как содержала ссылку на владельца, то теперь связь двусторонняя

// создаем область видимости
if true { // шаг 1
    let houseOwner = Human(name: "Vasya")
    
    if true { // шаг 2
        let house = House(title: "Частный дом", owner: houseOwner)
        houseOwner.add(house: house)
    } // шаг 3
    
    // шаг 4
    let secondHouse = House(title: "Appartment", owner: houseOwner)
    houseOwner.add(house: secondHouse)
}

// Сильные (strong), слабые (weak) и бесхозные (unowned) ссылки
// все создаваемые по умолчанию ссылки на объекты по умолчанию являются сильными (strong). Если объект имеет хотя бы одну входящую сильную ссылку, то он просто не может быть удален

// Если объект в куче имеет входящие слабые ссылки, но не имеет входящих сильных ссылок, то будет удален, как только для этого возникнут подходящие условия

// Для того чтобы пометить ссылку как сильную не нужно использовать специальные слова. Для слабых ссылок предназначен модификатор weak, который указывается перед объявлением свойства, содержащего ссылку:

// weak var nameProperty: OptionalTypeData?

// данный модификатор говорит о том что по усмотрению Swift значение свойства может быть переведено в nil, то есть уничтожено

class HouseOne {
    var title: String
    weak var owner: HumanOne?
    
    init(title: String, owner: HumanOne? = nil) {
        print("Дом \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом \(title) уничтожен")
    }
}

class HumanOne {
    var name: String
    var houses: [HouseOne] = []
    
    init(name: String) {
        print("Owner \(name) created")
        self.name = name
    }
    
    func add(house: HouseOne) {
        self.houses.append(house)
    }
    
    deinit {
        print("Owner \(name) kill")
    }
}

// создаем область видимости
if true { // шаг 1
    let houseOwner = HumanOne(name: "Petya")
    
    if true { // шаг 2
        let house = HouseOne(title: "Частный дом", owner: houseOwner)
        houseOwner.add(house: house)
    } // шаг 3
    
    // шаг 4
    let secondHouse = HouseOne(title: "Appartment", owner: houseOwner)
    houseOwner.add(house: secondHouse)
}

/*
 Использование модификатора weak привносит некоторые особенности:
 - так как значение свойства переводится в nil, оно должно быть опциональным
 - так как свойство изменяет свое значение (на nil), оно не может быть константой
 */

// Если необходимо сделать слабую ссылку на экземпляр неопционального типа данных, то используется модификатор unowned вместо weak, такие ссылки называются бесхозными

class HouseTwo {
    var title: String
    unowned var owner: HumanTwo
    
    init(title: String, owner: HumanTwo) {
        print("Дом \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом \(title) уничтожен")
    }
}

class HumanTwo {
    var name: String
    var houses: [HouseTwo] = []
    
    init(name: String) {
        print("Owner \(name) created")
        self.name = name
    }
    
    func add(house: HouseTwo) {
        self.houses.append(house)
    }
    
    deinit {
        print("Owner \(name) kill")
    }
}

if true {
    let ownerHouse = HumanTwo(name: "Pidor")
    
    if true {
        let house = HouseTwo(title: "Berloga", owner: ownerHouse)
        ownerHouse.add(house: house)
    }
    let appartment = HouseTwo(title: "Hata", owner: ownerHouse)
    ownerHouse.add(house: appartment)
}

// Указанные ключевые слова можно использовать только для хранилища конкретного экземпляра класса. Вы не можете указать слабую ссылку на массив экземпляров или на кортеж, состоящий из экземпляров класса. Именно по этой причине мы не могли определить ссылку от значения типа Human к House как слабую, свойство houses - это массив сущностей "Дом"




//: [Next](@next)
