//: [Previous](@previous)

import Foundation

// Extension (расширения) - позволяют добавить новыю функциональность к уже существующему объектному типу (классу, структуре, перечислению) или протоколу. Таким образом можно расширять возможности любых типов, даже тех что входят в состав Swift.
/*
С помощью расширений возможно:
 - добавить вычисляемые свойства экземпляра и вычисляемые свойства типа (static) к объектному типу;
 - добавить методы экземпляра и методы типа к объектному типу;
 - добавить новые инициализаторы, сабскрипты и вложенные типы;
 - подписать тип данных на протокол и обеспечить выполнение его требований
 */
// Расширения могут добавлять новую функциональность к типу, но не могут изменять существующую. Суть расширения состоит исключительно в наращивании возможностей, но не в их изменении
/*
 syntax
 extension NameType {
    // описание функциональности для расширяемого типа
 }
 */
// Новая функциональность, добавляемая расширением, становится доступной всем экземплярам расширяемого объектного типа вне зависимости от того, где эти экземпляры объявлены

// Вычисляемы свойтва в расширениях
// Расширения могут добавлять новые (только новые) вычисляемые свойства экземпляра и вычисляемые свойтва типа в уже существующий объектный тип
// хранимые свойства и наблюдателей свойтсв добавить нельзя - происходит ошибка

extension Double {
    var asKM: Double {
        self / 1000
    }
    var asM: Double {
        self
    }
    var asSM: Double {
        self * 100
    }
    var asMM: Double {
        self * 1000
    }
}

let length: Double = 25
length.asKM
length.asMM

// применение геттеров и сеттеров для вычисляемых свойств позволит использовать их возможности по максимуму

extension Double {
    var asFT: Double {
        get {
            return self / 0.3048
        }
        set {
            self = newValue * 0.3048
        }
    }
}

var distance: Double = 100 // расстояние в метрах
distance.asFT
distance.asFT = 150

// Методы в расширениях

extension Int {
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("la la")
}

// Для изменения свойств перечислений и структур (self) необходимо использовать ключевое слово mutating

extension Int {
    mutating func square() {
        self *= self
    }
}

var someInt = 3
someInt.square()


// Инициализаторы в расширениях - благодаря расширениям появляется возможность добавлять новые инициализаторы к существующему объектному типу. Так можно расширить типы, например для обработки экземпляров собственных типов, указав их в качестве входных аргументов

// Для классов расширения могут добавлять только вспомогательные инициализаторы (convinience). Попытка добавить назначенный инициализатор или деинициализатор приведет к ошибке

struct Line {
    var pointOne: (Double, Double)
    var pointTwo: (Double, Double)
}

extension Double {
    init(line: Line) {
        self = sqrt(pow(line.pointTwo.0 - line.pointOne.0, 2) + pow(line.pointTwo.1 - line.pointOne.1, 2))
    }
}
var myLine = Line(pointOne: (10, 10), pointTwo: (14, 10))
var lineLength = Double(line: myLine)


// Сабскрипты в расширениях

extension Int {
    subscript(digitIndex: Int) -> Int {
        var base = 1
        var index = digitIndex
        while index > 0 {
            base *= 10
            index -= 1
        }
        return (self / base) % 10
    }
}

5[1]

// Расширения протоколов
// с помощью расширений есть возможность подписать существующий тип на определенный протокол. Для этого в расширении после имени типа через двоеточие необходимо указать список новых протоколов.

protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    func asText() -> String {
        String(self)
    }
}

5.asText()

// c помощью расширения добавляем требование о соответствии типа протоколу, при этом обязательно указывается реализация метода (в расширении)

// Расширение протоколов и реализации по умолчанию
// Ррасширения могут расширять не только типы данных, но и протоколы.При этом они позволяют указать реализацию по умолчанию для любого метода этого протокола

protocol Descriptonal {
    func getDescription() -> String
}

// расширение протокола и указание реализации метода по умолчанию
extension Descriptonal {
    func getDescription() -> String {
        return "Description object type"
    }
}

// подпишем класс на протокол
class myClass: Descriptonal {}
print(myClass().getDescription())

// Реализация методов по умолчанию для протоколов доступна только при использовании расширений. Невозможно наполнить метод при объявлении протокола

// Всегда есть возможность переопределить реализацию метода по умочанию непосредственно в самом объектном типе

class myStruct: Descriptonal {
    func getDescription() -> String {
        return "Description struct"
    }
}
myStruct().getDescription()

// Реализация методов по умолчанию, а также множественное наследование протоколов являются основой методологии протокол-ориентированного программирования

// С помощью расширений есть возможность расширить и сами протоколы
// После расширения протокола описанные в нем реализации становятся доступны в экземплярах всех классов, которые приняли данный протокол к реализации

extension TextRepresentable {
    func about() -> String {
        return "Currant type support protocol TextRepresentable"
    }
}

5.about()



//: [Next](@next)
