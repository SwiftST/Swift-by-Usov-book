//: [Previous](@previous)

import Foundation

// Замыкания (closures) - организованные блоки с определенной функциональностью которые могут быть переданы и использованы в коде

func generateWallet(walletLength: Int) -> [Int] {
    let banknots = [50, 100, 200, 500, 1000, 2000, 5000]
    var wallet: [Int] = []
    for _ in 1...walletLength {
        wallet.append(banknots.randomElement()!)
    }
    return wallet
}

let myWallet = generateWallet(walletLength: 12)

func handle100(wallet: [Int]) -> [Int] {
    var returnWallet: [Int] = []
    for banknot in wallet {
        if banknot == 100 {
            returnWallet.append(banknot)
        }
    }
    return returnWallet
}

handle100(wallet: myWallet)

func hundle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet: [Int] = []
    for banknot in wallet {
        if closure(banknot) {
            returnWallet.append(banknot)
        }
    }
    return returnWallet
}

hundle(wallet: myWallet) { $0 == 100 }

// Вынос нескольких замыканий за скобки

func networkQuery(url: String, success: (String) -> Void, error: (Int) -> Void) {
    // код запроса на сервер
}

// Old variant
networkQuery(url: "http://weather.com", success: { date in }, error: { errorCode in })

// New variant
networkQuery(url: "https://weather.com") { data in
    // ...
} error: { errorCode in
    // ...
}


// Захват переменных
var a = 2
var b = 3
let closureSum: () -> Int = {
    a + b
}
closureSum()

a = 22
b = 2
closureSum()

// замыкание хранящееся в константе closureSum складывает значения переменных a и b. При изменении их значений и последующем вызове замыкания возвращаемое значение изменяется

// существует спооб захватить значения параметров, то есть зафиксироывть значения которые имеют эти параметры на момент объявления замыкания

var c = 1
var d = 2

let closureSumOne: () -> Int = { [c, d] in
    c + d
}
closureSumOne()

c = 11
d = 55
closureSumOne()


// автозамыкания - замыкания которые автоматически создаются из переданного выражения

var arraysOfNames = ["Helga", "Bazil", "Alex"]
//func printName(nextName: String) {
//    print(nextName)
//}
//printName(nextName: arraysOfNames.remove(at: 0))

func printName(nextName: @autoclosure () -> String) {
    print(nextName())
}
printName(nextName: arraysOfNames.remove(at: 0))

assert(c > 2, "Mistake")

// escaping closures
// для того чтобы позволить замыканию выйти за пределы области видимости функции, необходимо указать атрибут @escaping перед функциональным типом при описании входных параметров

// Предположим, что в программе есть специальная переменная, предназначенная для хранения замыканий типа () -> Int, то есть являющаяся коллекцией замыканий

var arrayOfClosure: [() -> Int] = []

//Пока еще пустой массив arrayOfClosures может хранить в себе замыкания с функциональным типом () -> Int. Реализуем функцию, добавляющую в этот массив переданные ей в качестве аргументов замыкания

//func addNewClosureInArray(_ newClosure: () -> Int) {
//    arrayOfClosure.append(newClosure)
//}

// Xcode сообщит вам об ошибке. И на то есть две причины:
//Замыкание — это тип-ссылка (reference type), то есть оно передается по ссылке, но не копированием.
//Замыкание, которое будет храниться в параметре newClosure, будет иметь ограниченную телом функции область видимости, а значит, не может быть добавлено в глобальную (по отношению к телу функции) переменную arrayOfClosures.

func addNewClosureInArray(_ newClosure: @escaping () -> Int) {
    arrayOfClosure.append(newClosure)
}
addNewClosureInArray {
    return 100
}
arrayOfClosure[0]



//: [Next](@next)
