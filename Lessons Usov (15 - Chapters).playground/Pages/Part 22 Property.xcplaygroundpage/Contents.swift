//: [Previous](@previous)

import Foundation

// Property - параметры объявленные в пределах объектного типа они могут хранить или вычислять значения
// Типы свойств
// stored property - могут использоваться в структурах и классах
// computed property - могут использоваться в перечислениях, структурах и классах

// ленивое хранимое свойство - значение которое должно храниться в ленивом свойстве, не создается до момента первого обращения к нему
// ленивое свойство не может быть константой let


// в этом примере ленивое свойство wholeName является lazy-by-need, то есть вычислиется один раз при обращении к нему и больше не изменяет свое значение
class Person {
    var name = "Name"
    var surname = "Surname"
    lazy var wholeName: String = self.generateWholeName()
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func generateWholeName() -> String {
        return name + " " + surname
    }
}

var me = Person(name: "John", surname: "Smith")
me.wholeName
me.name = "Bill"
me.wholeName


// в примере ниже ленивое свойтсво wholeName явлется lazy-by-name, то есть вычисляется каждый раз при обращении к нему
// так как свойство хранит в себе замыкание то и обращение к нему осуществляется с круглыми скобками

class SomePerson {
    var name = "Name"
    var surname = "Surname"
    lazy var wholeName: () -> String = {
        self.name + " " + self.surname
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

var otherMen = SomePerson(name: "Igor", surname: "Pavlov")
otherMen.wholeName()
otherMen.name = "Oleg"
otherMen.wholeName()

// Computed property - вычисляемые свойства не хранят значение, а вычисляют его каждый раз при обращении к ним
/*
 синтаксис
 var nameProperty: Type { тело зымыкающего выражения }
 */

class AnotherPerson {
    var name = "Name"
    var surname = "Surname"
    var wholeName: String {
        name + " " + surname
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}
var anotherPerson = AnotherPerson(name: "Lola", surname: "Green")
anotherPerson.wholeName
anotherPerson.surname = "Blue"
anotherPerson.wholeName

// геттер и сеттер для вычисляемых свойств
// Get (геттер) - выполняет некоторый код при попытки получить значение вычисляемого свойтсва
// Set (сеттер) - выполняет некоторый код при попытке установить значение вычисяемому свойству

/*
 var nameProperty: Type {
    get {
        // body get
        return returnValue
    }
    set (accoциированныйПармаметр - по умолчанию newValue) {
        // body set
    }
 }
 */

struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float
    var perimeter: Float {
        get {
            // вычисляем значение, используя текущее значение радиуса
            return 2.0 * 3.14 * radius
        }
        set(newPerimeter) {
            // изменяем текущее значение радиуса
            radius = newPerimeter / (2 * 3.14)
        }
    }
}
var myCircle = Circle(coordinates: (x: 0, y: 0), radius: 10)
myCircle.perimeter
myCircle.perimeter = 31.4
myCircle.radius

// Observers (наблюдатели хранимых свойств)
// Observers - это специальные функции, которые вызываются либо непоредственно перед установкой нового значения хранимого свойства, либо сразу после нее
// выделяют два вида наблюдателей
// willSet - вызывается перед установкой нового значения
// didSet - вызывается после установки нового значения

/*
 var nameProperty: Type {
    willSet (associativeValue) {
        // body observer
    }
    didSet (associativeValue) {
        // body observer
    }
 }
 */

struct SomeCircle {
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        willSet (newValueOfRadius) {
            print("Вместо значения \(radius) будет установлено \(newValueOfRadius)")
        }
        didSet (oldValueOfRadius) {
            print("Значение \(oldValueOfRadius) изменено на \(radius)")
        }
    }
    var perimeter: Float {
        get {
            return 2.0 * 3.14 * radius
        }
        set {
            radius = newValue / (2 * 3.14)
        }
    }
}
var newCircle = SomeCircle(coordinates: (x: 0, y: 0), radius: 10)
newCircle.perimeter
newCircle.radius = 5

// Cвойства типа - свойства самого типа, значение этих свойст является общим для всего типа целиком
// свойства типа объявляются с использованием ключевого слова static для перечислений, структур и классов. Единственным исключением являются маркируемые словом class вы- числяемые свойства класса, которые могут быть переопределены в подклассе

/*
 синтаксис
 struct SomeStructure {
    static var storedTypeProperty = "SomeValue"
    static var computedTypeProperty: Int {
        return 1
    }
 }
 enum SomeEnumeration {
    static var storedTypeProperty = "SomeValue"
    static var computedTypeProperty: Int {
        return 2
    }
 }
 class SomeClass {
    static var storedTypeProperty = "SomeValue"
    static var computedTypeProperty: Int {
        return 3
    }
 class var overrideableComputedTypeProperty: Int {
        return 4
    }
 }
 */

struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if volume > Self.maxVolume {
                volume = Self.maxVolume
            }
        }
    }
}

var leftChannel = AudioChannel(volume: 2)
var rightChannel = AudioChannel(volume: 3)
rightChannel.volume = 6
rightChannel.volume
AudioChannel.maxVolume = 10
rightChannel.volume = 8
rightChannel.volume




//: [Next](@next)
