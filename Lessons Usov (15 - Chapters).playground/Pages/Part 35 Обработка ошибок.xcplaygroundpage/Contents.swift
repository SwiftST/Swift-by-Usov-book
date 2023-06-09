//: [Previous](@previous)

import Foundation

// Обработка ошибок

// Обработка ошибок подразумевает реагирования на возникающие в процессе выполнения программы ошибки.
// Для описания ошибок обычно используются перечисления (enum), соответствующие протоколу Error

// example
enum FileError: Error {
    // файл не существует
    case notExists
    // нет прав доступа
    case notRights
}

// Выбрасывание ошибок

// example - работа торгового аппарата
enum VendingMachineError: Error {
    // неправильный выбор
    case invalidSelection
    // нехватка средств
    case insufficientFunds(coinsNeeded: Int)
    // отсутствие выбранного товара
    case outOfStock
}

// сама по себе ошибка позволяет показать, что произошла какато нестандартная ситуация и программа не может выполняться в обычном режиме
// процесс появления ошибки называется выбрасыванием ошибки
// для того чтобы выбросить ошибку необходимо воспользоваться оператором throw

// example - код проверки баланса счета, в случае недостатка монет выбрасывается ошибка
/*
guard productPrice <= accountBalance else {
    // определяем сколько монет не хватает
    let diff = productPrice - accountBalans
    // выбрасываем ошибку о нехватке монет
    // при этом передаем количество монет
    throw VendingMachineError.insufficientFunds(coinsNeeded: diff)
}
*/

// Ошибку недостаточно выбросить ее необходимо перехватить и корректно обрабоать
// Swift предлагает четыре способа обработки ошибок:
// 1. передача выброшенной ошибки в вышестоящий код
// 2. обработка ошибки оператором do-catch
// 3. преобразование ошибки в опционал
// 4. подавление выброса ошибки

// Если при вызове какой либо функции или метода он может выбросить ошибку, то перед именем данной функции необходимо указать ключевое слово try

// 1. Передача ошибки
// Функция (или метод), выбросившая ошиьку, может не самостоятельно обрабатывать ее, а передать выше в код, который вызвал данную функцию. Для этого в сигнатуре функции после списка параметров указывается ключевое слово throws

// перечисление, содержащее ошибки
enum CustomError: Error {
    case wrongName
}

// функция, которая выбрасывает ошибку
// и передает ее "наверх"
func funcThrowsError() throws {
    //..
    throw CustomError.wrongName
    //..
}
// функция, которая НЕ выбрасывает ошибку,
// но получает ошибку, выброшенную функцией funcThrowsError
// после чего передает ее "наверх"
func funcGetsError() throws -> String {
    //..
    try funcThrowsError()
    //..
    return "text resultt"
}
// в данной области кода ошибка может быть получена и обработана
//try funcGetsError()

// если функция не помечена ключевым словом throws, то все возникающие внутри нее ошибки она должна обрабатывать самостоятельно
// описывает одно наименование продукта
struct Item {
    var price: Int
    var count: Int
}
// описывает торговый автомат
class VendingMachine {
    // информация о наличии определенных товаров
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    // количество внесенных в автомат монет
    var coinsDeposited = 0
    // сообщает о том что аппарат выдает некий товар
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    // обслуживает покупку товара, при определенных условиях может выбросить ошибку
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            // оператор throw мгновенно изменяет ход работы программы
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded:  item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}
// так как метод vend(itemNamed:) передает все возникающие в нем ошибки вызывающему его коду, то данный метод дожен быть вызван с помощью оператора try, а сама ошибка обработана в родительском коде

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy bar"
    try vendingMachine.vend(itemNamed: snackName)
}
// сама функция buyFavoriteSnack(person: String, vendingMachine: VendingMachine) не выбрасывает ошибку, она вызывает метод vend, который может выбросить ошибку. И в этом случае используются операторы throws и try

// 2. Оператор do-catch
// Выброс и передача ошиьок вверх в конце концов должны вести к их обработке. Для этого возможно задействовать оператор do-catch

// syntax
/*
 do {
    try имяВызываемогоБлока
 } catch шаблон1 {
    // код..
 } catch шаблон2, шаблон3 {
    // код..
 } catch {
    // код...
 }
 */
// Оператор содержит блок do и произвольное количество блоко catch. В блоке do должен содержаться вызов функции или метода, которые могут выбросить ошибку. Вызов осуществляется с помощью оператора try
// Если в в результате вызова была выброшена ошибка, то она сравнивается с шаблонами в блоках catch. Если в одном из них найдено совпадение, то выполняется блок из данного блока
// Можно использовать ключевое слово where в шаблонах условий

// Блок catch можно задействовать без указания шаблона, тогда этот блок соответствует любой ошибке, а сама ошибка будет находиться в переменной error

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Incorrect choose")
} catch VendingMachineError.outOfStock {
    print("товара нет в наличии")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("недостаточно средств, пожалуйста внесите еще \(coinsNeeded) монет(ы)")
}

// 3. Преобразование ошибки в опционал
// Для преобразования выброшенной ошибки в опционал используется оператор try?. Если в этом случае выбрасывается ошибка, то значение выражения вычисляется как nil

//func someThrowingFunction() throws -> Int {
//    //...
//}
//let x = try? someThrowingFunction()

// если функция someThrowingFunction() выбросит ошибку, то в константе х окажется значение nil

// 4. Подавление выброса ошибки
// в некоторых ситуациях можно быть уверенным, что блок кода во время исполнения не выбросит ошибку. В этом случае необходимо использовать оператор try!, который сообщает что данный блок гарантированно не выбросит ошибку

//let photo = try! loadImage("./Resources/John Applessed.jpg")

// Структуры и классы для обработки ошибок

struct NetworkError: Error {
    var code: Int
    func description() -> String {
        return "it is network error with code \(code)"
    }
}

// В этом случае для того чтобы поймать ошибку с помощью конструкции do-catch необходимо использовать ключевое слово is, чтобы сопоставить тип ошибки с объектынм типом NetworkError

do {
    // принудительно вызываем исключительную ситуацию
    throw NetworkError(code: 404)
} catch let error as NetworkError {
    print("\(error.description())")
} catch {
    // ..
}



//: [Next](@next)
