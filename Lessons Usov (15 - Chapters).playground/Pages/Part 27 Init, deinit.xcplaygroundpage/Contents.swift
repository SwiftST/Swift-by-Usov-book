//: [Previous](@previous)

import Foundation

// Инициализаторы и деинициализаторы

// Инициализатор (конструктор) - это специальный метод, выполняющий подготовительные действия при создании экземпляра объектного типа данных. Инициализатор срабатывает при создании экземпляра, а при его удалении вызывается деинициализатор.
// Инициализатор выполняет установку начальных значений хранимых свойств и различных настроек, которые нужны для использования экземпляра.

// Инициализаторы класса и структуры, производящие установку значений свойств называются назначенными (designated). Можно разработать произвольное количество назначенных инициализаторов с отличающимся набором параметров в пределах одного объектного типа. При этом должен существовать хотябы один назначенный инициализатор, производящий установку значений всех свойств (если они существуеют) и один из назначенных инициализаторов должен обязательно вызываться при создании экземпляра.
// Назначенный инициализатор не может вызывать другой назначенный инициализатор, то есть использование конструкции self.init() запрещено
// Инициализаторы наследуются от суперекласса к подклассу

// Помимо назначенных в swift есть вспомогательные (convenience) инициализаторы. Они являются вторичными и поддерживающими
/*
 Синтаксис
 convenience init(parametrs) {
    // body of init
 }
 вспомогательный инициализатор объявляется с помощью модификатора convenience, за которым следует ключевое слово init. Данный тип инициализатора также может принимать входные аргументы и устанавливать значения для свойств.
 в теле инициализатора обязательно должен находиться вызов одного из назначенных инициализаторов
 */
open class Quadruped {
    var type = ""
    var name = ""
    
    func walk() {
        print("walk")
    }
}
// subclass
class Dog: Quadruped {
    override init() {
        super.init()
        self.type = "dog"
    }
    
    convenience init(text: String) {
        self.init()
        print(text)
    }
    
    func bark() {
        print("woof")
    }
}

var someDog = Dog(text: "Instance class of Dog create")

// Наследование инициализаторов
// 1. Если подкласс имеет собственный назначенный инициализатор, то инициализаторы родительского класса не наследуются
// 2. Если подкласс переопредеяет все назначенные инициализаторы суперкласса, то он наследует и все его вспомогательные инициализаторы

// Отношения между инициализаторами
/*
 1. Назначенный инициализатор подкласса должен вызвать назначенный инициализатор суперкласса
 2. Вспомогательный инициализатор должен вызвать назначенный инициализатор того же объектного типа
 3. Вспомогательный инициализатор в конечном счете должен вызвать назначенный инициализатор
 */

// Проваливающиеся инициализаторы (failable)
// В некоторых ситуациях бывает необходимо определить объектный тип, создание экземпляра которого может закончиться неудачей, вызванной некорректным набором внешних параметров, отсутствием какого-либо внешнего ресурса или иным обстоятельством. Для этой цели служат проваливающиеся (failable) инициализаторы. Они способны возвращать nil при попытке создания экземпляра. И это их основное предназначение

/*
 Syntax
 init?(parametrs) {
    body init
    return nil
 }
 */
// в теле проваливающегося инциализатора должно присутствовать выражение return nil

// example
class Rectangle {
    var height: Int
    var weight: Int
    init?(height h: Int, weight w: Int) {
        height = h
        weight = w
        if !(h > 0 && w > 0) {
            return nil
        }
    }
}
var rectangle = Rectangle(height: 0, weight: 1)
rectangle

// в классах проваливающийся инициализатор может веернуть nil только после установки значений всех хранимых свойств. В случае структур данное ограничение отсутствует

// назначенный инициализатор в подклассе может переопределить проваливающийся инициализатор суперкласса, а проваливающийся инициализатор может может вызывать назначенный инициализатор того же класса

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

var temperature = TemperatureUnit(symbol: "ь")

// у перечислений члены которых имеют rawValue есть проваливающийся инициализатор init?(rawValue:). Его можно использовать без определения в коде

enum TemperatureUnitTwo: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnitTwo(rawValue: "F")
fahrenheitUnit!.hashValue

// Обязательные инициализаторы (required) - это инициализатор который обязательно должен быть определен во всех подклассах данного класса
/*
 syntax
 required init(parametrs) {
    body init
 }
 */
// модификатор required необходимо указывать перед каждой реализацией данного инициализатора в подклассах, чтобы последующие подкклассы также реализовывали этот инициализатор.
// при реализации инициализатора в подклассе ключевое слово override неиспользуется

// Деинициализаторы (deinit)
// Диинициализатор (деструктор) - это специальный метод, который автоматически вызывается во время уничтожения экземпляра класса. Вы не можете вызвать деинициализатор самостоятельно. Один класс может иметь не более одного деинициализатора.

// деинициализаторы не доступны для структур
// c помощью деинициализатора можно освободить используемые экземпляром ресурсы, вывести на консоль журнал или выполнить другие действия

/*
 syntax
 deinit {
    body deinit
 }
 */

// Деинициализатор суперкласса наследуется подклассом и вызывается автоматически в конце работы деинициализаторов подклассов. Деинициализатор суперкласса вызывается всегда даже если деинициализатор подкласса отсутствует.
// Экземпляр класса не удаляется пока не закончит работу деинициализатор поэтому все значения свойств экземпляра остаются доступными в теле деинициализатора

// example

class SuperClass {
    init?(isNil: Bool) {
        if isNil {
            return nil
        } else {
            print("instance created")
        }
    }
    deinit {
        print("deinit SuperClass")
    }
}

class SubClass: SuperClass {
    deinit {
        print("deinit SubClass")
    }
}

var obj = SubClass(isNil: false)
obj = nil



//: [Next](@next)