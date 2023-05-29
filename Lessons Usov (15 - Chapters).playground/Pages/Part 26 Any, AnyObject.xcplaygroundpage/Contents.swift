//: [Previous](@previous)

import Foundation


// AnyObject - соответствует произвольному экземпляру любого класса
// Any - соответствует произвольному типу данных

// Псевдоним Any
// Благодаря псевдониму Any можно создавать хранилища неопределенного типа данных.

// example
var things: [Any] = []
things.append(0)
things.append(0.0)
things.append(42)
things.append("hi")
things.append((3.0, 5.0))
things.append({(name: String) -> String in
    "Hello \(name)"
})
type(of: things)

// Псевдоним Any немовместим с протоколом Hashable, поэтому использование типа Any там, где необходимо сопоставление, невозможно. Это относится например к ключам словарей Dictionary<Key> и множествам Set

// Для анализа каждого элемента массива необходимо выполнить приведение типа

for thing in things {
    switch thing {
    case let someInt as Int:
        print("as integer value of \(someInt)")
    case let someDouble as Double:
        print("a positive double value of \(someDouble)")
    case let someString as String:
        print("a string value of \(someString)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Troll"))
    default:
        print("some else")
    }
}
// каждый из элементов массива преобразуется в определенный тип при помощи опреатора as. При этом в конструкции switch-case даннный оператор не требует указывать какой либо постфикс (знак восклицания или вопроса)

// Пседводоним AneObject

// superclass
class Quadruped {
    var type = ""
    var name = ""
    
    func walk() {
        print("walk")
    }
}
// subclass
class Dog: Quadruped {
    func bark() {
        print("woof")
    }
    override init() {
        super.init()
        self.type = "dog"
    }
}

class NoisyDog: Dog {
    override func bark() {
        print("woof")
        print("woof")
        print("woof")
    }
}

// псевдоним AnyObject позволяет указать на то, что в данном месте должен или может находиться экземпляр любого класса. 

// объявление массива экземпляров с помощью псевдонима AnyObject

let someObjects: [AnyObject] = [Dog(), NoisyDog(), Dog()]

// при извлечении элемента из массива мы получаем экземпляр AnyObject который не имеет методов и свойств для взаимодействия с ним
// Приведение типа AnyObject

for object in someObjects {
    let animal = object as! Dog
    print(animal.type)
}

for object in someObjects as! [Dog] {
    object.bark()
}


// безопасное извлечение
for object in someObjects {
    guard let animal = object as? Dog else {
        continue
    }
    print(animal.type)
}


for object in (someObjects as? [Dog]) ?? [] {
    print(object.type)
}


//: [Next](@next)
