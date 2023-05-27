//: [Previous](@previous)

import Foundation

// Memory management (управление памятью)

// Утечка пямяти - это прогамная ошибка, приводящая к излишнему расходованию оперативной памяти

/*
 Выделенная приложению память логически делится на три области
 1) Статическая память, в которой размещается код приложения, различные библиотеки, метаданные и глобальные переменные необходимые для работы
В процессе компиляции приложение переводится в машинный код, то есть код понятный компьютеру. А в процессе загрузки этот код, вместе с различными библиотеками, загружается в статическую область памяти, откуда по мере необходимости вызывается. Статическая память выделяется один раз еще до появления приложения на экране и существует все время пока приложение работает
 2) Автоматическая память, в которой хранятся все локальные для текущей области видимости параметры
 Автоматическая память работает на основе структуры данных стек (stack), то есть по принципу - "последним пришел - первым вышел" (Last in, first out, или LIFO).
 В стеке хранятся все локальные (относящиеся к данной области  видимости) значения. То есть как только создается новая переменнная, она помещается в стек, следующая переменная помещается поверх нее и т.д. А при выходе из данной области видимости все созданные значения последовательно удаляются из стека.
 Стек - это лишь способ хранения параметров и их значений. Это не значит, что у вас при этом есть доступ только к верхнему элементу стека. Ваше приложение всегда хранит ссылки на адреса всех параметров, и вы при необходимости можете получить доступ к любому из них (в соответствии с их областью видимости) для их чтения или изменения. Но удаляются элементы стека последовательно.
 В Swift в стеке хранятся value type, а так же указатели на ссылочные типы (reference type).
 */
 
// структура описывающая сущность "приложение"
struct Application {
    var name: String
}

// функция производящая загрузку ресурсов
func loadResources(forApp: Application) {
    let appPath = "./bin/\(forApp.name)/"
}

// функция - точка входа в приложение
func main(testMode: Bool) {
    let app = Application(name: "Calculator")
    loadResources(forApp: app)
    //... последующие операции внутри функции
}

// начало работы программы
main(testMode: true)

// Структура Application и функция main(testMode:) после загрузки будут находиться в статической памяти. В ходе работы приложения по мере необходимости они будут вызваны оттуда.
// Как только в программе создается новая область видимости (scope) - в данном случае вызывается функция mail, - в стеке создается новый фрейм (специальный блок, объединяющий несколько элементов одной области видимости), в котором выделяется место под локальные для этой области видимости параметры и их значения


 /*
 3) Динамическая память, в которой память динамически выделяется по запросу. Для хранения значения ссылочных типов используется динамическая память.
  Динамическая память - это облатсь, память в которой выделяется по запросу приложения. Данная область также называется кучей (heap). Объекты в куче не упорядочены, программа при необходимости захватывает память требуемого объема и помещает туда значение. При этом в стеке создается запись, в которой сохраняется ссылка на объект в куче.
 */
 
class SomeApplication {
    var name: String
    
    init(name: String) {
        print("create instance")
        self.name = name
    }
    
    deinit {
        print("kill instance")
    }
}

func someLoadResources(forApp: SomeApplication) {
    print("start function someLoadResources")
    let appPath = "./bin/\(forApp.name)/"
    // ...последующие операции внутри функции
    print("end function someLoadResources")
}

func someMain(testMode: Bool) {
    print("start function someMain")
    let app = SomeApplication(name: "Calculator")
    someLoadResources(forApp: app)
    // ... последующие операции внутри цикла
    print("end function someMain")
}

someMain(testMode: true)

// Уничтожение экземпляров
/*
 Cтандартный цикл жизни экземпляров объектных типов состоит из следующих шагов:
 1. выделение в памяти (в стеке или куче)
 2. инициализация (выполнение кода в методе init)
 3. использование
 4. деинициализация (выполнение кода в методе deinit, актуально только для классов)
 5. освобождение памяти
 */

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
    
    init(name: String) {
        print("Владелец \(name) создан")
        self.name = name
        return
    }
    
    deinit {
        print("Владелец \(name) уничтожен")
    }
}

// создаем область видимости
if true { // шаг 1
    let houseOwner = Human(name: "Vasiliy")
    
    if true { // шаг2
        let house = House(title: "Частный дом", owner: houseOwner)
    } // шаг 3
    
    // шаг 4
    let secondHouse = House(title: "Appartment", owner: houseOwner)
} // шаг 5







//: [Next](@next)
