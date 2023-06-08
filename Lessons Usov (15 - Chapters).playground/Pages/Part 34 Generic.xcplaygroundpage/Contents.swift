//: [Previous](@previous)

import Foundation

// Универсальный шаблоны (дженерики) - предназнеченвя для того, чтобы сделать ваш код более качественным: вы сможете писать меньше кода получая тот же самый результат

// Универсальные шаблоны в Swift представлены тремя базовыми элементами:
// - Универсальные функции
// - Универсальные протоколы
// - Универсальные объектные типы

// С помощью универсальных шаблонов возможно реализовывать очень гибкие конструкции без привязки к конкретным типам данных

// Проблема дублирования кода
var first = 3
var second = 5

func change(a: inout Int, b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

change(a: &first, b: &second)

func change(a: inout String, b: inout String) {
    let tmp = a
    a = b
    b = tmp
}

// Дженерики позволяют решить эту проблему, создав единый для всех типов данных механизм

// Универсальные функции
// Для того чтобы объявить универсальную функцию, после имени функции в угловых скобках необходимо указать заполнитель типа, например - nameFunction<T> , который будет использован в сигнатуре или в теле функции как указатель на пока еще не определенный тип данных. То есть с помощью заполнителя <T> вы определяете параметр типа Т, который будет использоваться в качестве указателя на тип данных.

// <T> - заполнитель типа
//  Т  - параметр типа

// При нескольких заполнителях в пределах одного дженерика используйте Т1, Т2 и т.д.

func change<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

// с помощью этой универсальной функции мы заменим все ранее написанные функции обмена значениями

var firstString = "Hello"
var secondString = "World"

change(a: &firstString, b: &secondString)
firstString
secondString

first
second
change(a: &first, b: &second)
first
second

// при вызове универсальной функции заполнитель типа опускается. он используется только на этапе объявления дженерика

func printValues<T1,T2>(a: T1, b: T2) {
    print("Value 1 - \(a), value 2 - \(b) ")
}
printValues(a: "124", b: 2)
printValues(a: 1.22, b: 3.1)

func getSelf<T>(_ a: T) -> T {
    return a
}

getSelf("A")

// Ограничения типа
// К параметрам типа могут быть применены различные ограничения, уточняющие, какие именно типы данных можно испльзовать в том или ином случае
// Реализуем универсальную функуию, производящую сложение переданных ей значений и возвращающую результат этойтоперации
/*
func sum<T>(_ a: T, _ b: T) -> T {
    return a + b
}
*/
// в функции выше будет ошибка компиляции, так как оператор + не может быть использован при сложении двух типов Т, а может быть использован только при сложении конкретных типов данных.
// получается необходимо ввести ограничения или иными словами указать какие именно типы данных могут быть использованы вместо параметра Т, таким образом исключив не подходящие типы данных
// ограничим функции только для числовых значений

// Ограничения могут быть указаны двумя способами:
// 1. Непосредственно в заполнителе типа, через двоеточие после параметра:
func sum<T: Numeric>(_ a: T, _ b: T) -> T {
    a + b
}
var assd = sum(23, 1.1)
//sum("ad", "sd")
// 2. C помощью ключевого солова where, указываемого после сигнатуры функции
func sumOne<T>(_ a: T, _ b: T) -> T where T: Numeric {
    a + b
}
sumOne(34, 2)

func search<T: Comparable>(value: T, in collection: [T]) -> Bool {
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}
var integers = [1, 4, 5, 6]
search(value: 5, in: integers)

// Универсальные объектные типы
// Реализуем структуры хранения целочисленных значений в виде стека (LIFO - last in first out)

struct StackInt {
    var items: [Int] = []
    // добавляем новый элемент в начало стека
    mutating func push(_ item: Int) {
        items.insert(contentsOf: [item], at: 0)
    }
    // возвращаем первый элемент, удаляя его оттуда
    mutating func pop() -> Int {
        return items.removeFirst()
    }
}

var intStorage = StackInt(items: [1, 2, 3, 4, 5])
intStorage.items
intStorage.pop()
intStorage.push(9)
intStorage.items

// Эта структура имеет один недостаток: область ее применения ограничена типом Int

struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.insert(contentsOf: [item], at: 0)
    }
    mutating func pop() -> T {
        items.removeFirst()
    }
}

var genericIntStorage = Stack(items: [1, 2, 3, 4, 5])
var genericStringStorag = Stack(items: ["bob", "Jihn", "Alex"])

// Ограничения доступны и при работе с универсальными объектными типами

struct StackOne<T: Numeric> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.insert(contentsOf: [item], at: 0)
    }
    mutating func pop() -> T {
        items.removeFirst()
    }
}

// Расширения (extension) универсального типа
// Универсальные типы могут быть расширены точно так же: как и обычные объектные типы данных

extension Stack {
    mutating func replaceFirst(_ newValue: T) {
        items[0] = newValue
    }
}

genericIntStorage.items
genericIntStorage.replaceFirst(9)
genericIntStorage.items

// Универсальные протоколы


// Как произвести поиск по по диапазону значений. Для этого нужно объяаить два указателя: Т1 - должен быть сопоставимым (Comparable), T2 - должен соответствовать протоколы (Collection)

/*
func search<T1, T2>(value: T1, in collection: T2) -> Bool
where T1: Comparable, T2: Collection {
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}
*/
// Однако в данном варианте будет ошибка, так как Swift не позволяет сравнивать между собой значения различных типов (например мы не можем икать String в Array<Int>). Но использованный синатаксис функции search не запрещает передать конфиликтующие значения. По этой причине необходимо указать новое ограничение, которое будет говорить о том, что тип искомого элемента должен соответствовать типу элементов коллекции. Добавим новое ограничение

func search<T1, T2>(value: T1, in collection: T2) -> Bool
where T1: Comparable, T2: Collection, T1 == T2.Element {
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}

// Использование ассоциированных параметров

// Вернемся к ранее созданному универсальному объектному типу, описывающему стек

struct StackTwo<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.insert(contentsOf: [item], at: 0)
    }
    mutating func pop() -> T {
        items.removeFirst()
    }
}

// Реализуя данную структуру мы отошли от принципов ПОП, пропустили этап создания протокола. Как сделать протокол, который может стать основой для универсального типа? Для этого и нужны универсальные протоколы с ассоциированными типами
// Создавая протокол с помощью ключевых слов associatedtype, можно указать необходимые ассоциированные типы, после чего использовать их при описании требований внутри протокола

protocol StackProtocol {
    associatedtype ItemType
    var items: [ItemType] { get set }
    mutating func push(_: ItemType)
    mutating func pop() -> ItemType
}

// в этом протоколе с помощью ключевого слова associatedtype указывается, что в принимающем данный протокол объектном типе будет использован некий пока неизвестный тип данных, обозначенный в протоколе как ItemType
// таким образом, ItemType (аналогично Element в протоколе Collection) - это некий заполнитель, который используется, чтобы описать требования в теле протокола
// теперь мы можем подписать структуру Stack на данный протокл, но при этом в ней потребуется создать псевдоним (typealias), указывающий что ItemType это T (пока неизвестный тип)
extension StackProtocol {
    mutating func push(_ item: ItemType) {
        items.insert(contentsOf: [item], at: 0)
    }
    mutating func pop() -> ItemType {
        items.removeFirst()
    }
}

struct StackThree<T>: StackProtocol {
    // псевдоним для ассоциативного типа
    typealias ItemType = T
    var items: [T]
}

var instanceStack = StackThree(items: [1, 2.3])
instanceStack.push(10)
instanceStack.items
instanceStack











//: [Next](@next)
