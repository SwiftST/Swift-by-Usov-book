//: [Previous](@previous)

import Foundation

// Протокол - это перечень требований, которым должен удовлетворять тип данных соответствующий ему

/* Если к типу данных применяется протокол, то это означает:
 - тип данных подписан на протокол
 - тип данных реализует требования протокола
 - тип данных принимает протокол к реализации
 - тип данных соответствует протоколу
*/

// после подписки на протокол тип данных обязан выполнить все его требования, то есть реализовать свойства, методы и сабскрипты, описанные в протоколе. При этом тип может быть подписан на произвольное количество протоколов

/* Требуемые свойства
В протоколе может содержаться требование к реализации одного или нескольких свойств (в том числе свойтв типа, указваемых с помощью ключевого слова static). При этом для каждого свойства в протоколе указывается:
 - название
 - тип данных
 - требования доступности и изменяемости
*/

// example
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotBeSettable: Int { get }
}
/* Протокол SomeProtocol имеет требования реализацию двух свойств. Таким образом, если тип данных подпишется на этот протокол, то в нем потребуется реализовать данные свойства, при этом:
 - имена свойств должны соответствовать, указанным в протоколе
 - тип данных обоих свойств - Int
 - свойство mustBeSettable должно быть доступно как для чтения, так и для изменения, то есть в нем должны быть и геттер и сеттер
 - свойство doesNotBeSettable, должно иметь как минимум геттер
*/

struct SomeStrust: SomeProtocol {
    var mustBeSettable: Int
    let doesNotBeSettable: Int
    // дополнительный метод не описанный в протоколе
    func getSum() -> Int {
        return self.mustBeSettable + self.doesNotBeSettable
    }
}

// Для указания в протоколе требования к реализации свойства типа необходимо использовать модификатор static

protocol AnotherProtocol {
    static var someTypeProperty: Int { get }
}

struct AnotherStruct: SomeProtocol, AnotherProtocol {
    static var someTypeProperty: Int = 3
    
    var mustBeSettable: Int
    let doesNotBeSettable: Int
    
    func getSum() -> Int {
        return self.mustBeSettable + self.doesNotBeSettable + Self.someTypeProperty
    }
}

// Требуемые методы
// Помимо свойств, протокол может модержать требования к реализации одного или нескольких методов. Для требования реализации метода типа необходимо использовать модификатор static, а для изменяющего метода - mutating

protocol RandomNumberGenerator {
    var randomCollection: [Int] { get set }
    func getRandomNumber() -> Int?
    mutating func setNewRandomCollection(newValue: [Int])
}

// Examples
struct RandomGenerator: RandomNumberGenerator {
    var randomCollection: [Int] = [1, 2, 3, 4, 5]
    
    func getRandomNumber() -> Int? {
        return randomCollection.randomElement()
    }
    mutating func setNewRandomCollection(newValue: [Int]) {
        self.randomCollection = newValue
    }
}

class RandomGeneratorClass: RandomNumberGenerator {
    var randomCollection: [Int] = [1, 2, 3, 4, 5]
    
    func getRandomNumber() -> Int? {
        if let randomElement = randomCollection.randomElement() {
            return randomElement
        } else {
            return 0
        }
    }
    
    func setNewRandomCollection(newValue: [Int]) {
        randomCollection = newValue
    }
}

// Требуемые инициализаторы
// Протокол может предъявлять требования к реализации инициализаторов. При этом в классах можно реализовать назначенные (designated) или всмогоательыне (convenience) инициализаторы. В любом случае перед объявлением инициализатора в классе необходимо указывать модификатор required. Это гарантирует, что вы реализуете указанный инициализатор во всех подклассах данного класса.

protocol Named {
    init(name: String)
}

class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

// Протокол в качестве типа данных

// протокол указывающий на множество типов. Протокол может выступать в качестве указателя на множество типов данных. С его помощью определяется требование к значению: оно должно иметь тип данных, соответствующий указанному протоколу

func getHash<T: Hashable>(of value: T) -> Int {
    return value.hashValue
}

getHash(of: "a")
getHash(of: 12123)

// Протокол и операторы as? и as!

protocol HasValue {
    var value: Int { get set }
}

class ClassWithValue: HasValue {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}

struct StructWithValue: HasValue {
    var value: Int
}

// коллекция элементов
let objects: [Any] = [
    2,
    StructWithValue(value: 3),
    true,
    ClassWithValue(value: 1),
    "dgdng"
]

for object in objects {
    if let elementWithValue = object as? HasValue {
        print("Значение \(elementWithValue.value)")
    }
}

// протокол и оператор is - есть возможность проверить соответствует ли тип данных значения протоколу

for object in objects {
    print(object is HasValue)
}

// Наследование протоколов
// Протокол может наследовать один или более других протоколов. При этом в него могут быть добавлены новые требования поверх наследуемых - тогда тип, принявший протокол к реализации, будет вынужден выполнить требования всех протоколов в иерархии. При наследовании протоколов используется тот же синтаксис, что и при наследовании классов

protocol GeometricFigureWithXAxis {
    var x: Int { get set }
}

protocol GeometricFigureWithYAxis {
    var y: Int { get set }
}

protocol GeometricFigureTwoAxis: GeometricFigureWithXAxis, GeometricFigureWithYAxis {
    var distanceFromCenter: Float { get }
}

struct Figure2D: GeometricFigureTwoAxis {
    var x: Int = 0
    var y: Int = 0
    
    var distanceFromCenter: Float {
        let xPow = powf(Float(x), 2)
        let yPow = powf(Float(y), 2)
        let length = sqrtf(xPow + yPow)
        return length
    }
}

// Классовые протоколы (можно ограничить применение протокола исключительно на классы, запретив его использование для структур и перечислений. Для этого после имени протокола через двоеточие необходимо указать ключевое слово AnyObject, после которого могут быть определены родительские протоколы)

protocol SuperProtocol { }
protocol SubProtocol: AnyObject, SuperProtocol { }
class ClassWithProtocol: SubProtocol { }
//struct StructWithProtocol: SubProtocol { }

// Композиция протоколов - в сучаях, когда протокол выступает в качестве указателя на множество типов данных, бывает удобнее требовать, чтобы тип данных используемого значения соответствовал не одному, а нескольким протоколам. В этом случае есть два варианта:
// 1. Создать протокол, который подписывается на два родительских протокола, и использовать его в качестве указателя на тип данных
// 2. Использовать композицию протоколов, то есть комбинацию нескольких протоколов

// Для композиции необходимо указать имена входящих в нее протов=колов, разделив их ампермантом &

protocol NamedOne {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct PersonOne: NamedOne, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: NamedOne & Aged) {
    print("С днем рождения, \(celebrator.name)! Тебе уже \(celebrator.age)")
}
let birthdayPerson = PersonOne(name: "John", age: 33)
wishHappyBirthday(celebrator: birthdayPerson)
//: [Next](@next)
