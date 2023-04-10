//: [Previous](@previous)

import Foundation

// Функцию стоит объявлять тогда, когда некоторый код может быть многоократно использован. С ее помощью исключается дублирование кода

/*
 Функция:
 - Имеет свой функциональный тип данных
 - Может быть записана в константу или переменную и в таком виде передана
 - может иметь или не иметь входные параметры
 - создает отдельную область видимости внутри себя
 - может возвращать значение как результат исполнения тела функции
 */

// при объявлении функции указываются входные параметры, а при ее вызове передаются аргументы

// если функция ничего не возвращает

func myFirstFunc() -> Void {
    print("1")
}

func myFirstFuncTwo() -> () {
    print("2")
}

func myFirstFuncThree() {
    print("3")
}

// Если функция что-то возвращает, то в ее теле должен присутствовать оператор return. Если тело функции состоит из одного выражения оператор return можно опустить
// Функция может содержать произвольное количество операторов return по достижении первого из них работа функции завершиться

//Входные параметры и возвращаемое значение

func sumTwoInt(a: Int, b: Int) {
    print("result operation equal - \(a + b)")
}
sumTwoInt(a: 1, b: 34)

// Ярлык аргументов функции - задается при объявлении функции и ставиться перед именем параметра через пробел, после чего при вызове функции будут использоваться ярлыки вместо имен параметров. Так же можно указать символ _ вместо ярлыка функции, в таком случае при вызове функции не нужно указыть ничего

func sumTwoIntOne(num1 a: Int, num2 b: Int) {
    print("result operation equal - \(a + b)")
}

sumTwoIntOne(num1: 1, num2: 2)

func sumTwoIntTwo(_ a: Int, _ b: Int) {
    print("result operation equal - \(a + b)")
}

sumTwoIntTwo(23, 55)

// Возвращаемое значение

func sumTwoInt(_ a: Int, _ b: Int) -> Int {
    let result = a + b
    print("result equal = \(result)")
    return result
}

var result = sumTwoInt(33, 2)

// сквозные параметры (inout)

// Чтобы указать на то что входной параметр будет сквозным перед его именем типа ставится inout. Сквозной параметр передается в функцию изменяется в ней и сохраняет свое значение после ее завершения. При выхзове функции перед сквозными параметрами ставится амперсанд & указывающий на то что параметр передается по ссылке

// в качестве сквозного параметра может передавться только переменная, константы и литералы передать нельзя так как их нельзя изменить

var valueOne = 2
var valueTwo = 66

func swapValue(a: inout Int, b: inout Int) {
    let c = a
    a = b
    b = c
}

swapValue(a: &valueOne, b: &valueTwo)
valueOne
valueTwo

// Вариативный параметр - позволяет передать некоторое количество однотипных значений количество которых может быть заранее неизвестно. Для того чтобы указать что параметр вариативный посли имени типа ставится ... (Int...)

func prinyRequestString(codes: Int...) {
    var codeString = ""
    for oneCode in codes {
        codeString += String(oneCode) + " "
    }
    print("Answer - \(codeString)")
}

prinyRequestString(codes: 22, 244, 65)

// значения по умолчанию в качестве входного параметра (параметры со значением по умолчанию указываются после остальных параметров)

func printGreeting(name: String = "Julia") {
    print("Hello \(name)")
}
printGreeting(name: "Vasya")
printGreeting()


// простой функциональный тип - () -> Void or (Int) -> String

// сложный функциональный тип - () -> () -> Void or (Int) -> (String) -> Int?

// функция генерации случайного числа банкнот в кошельке

func generateWallet(walletLength: Int) -> [Int] {
    let typesOfBanknotes = [50, 100, 200, 1000, 2000, 5000]
    var wallet: [Int] = []
    for _ in 1...walletLength {
        wallet.append(typesOfBanknotes.randomElement()!)
    }
    return wallet
}

// фунция подсчета денег в кошельке

func sumWallet(walletLength: Int, wallet: (Int) -> [Int]) -> Int? {
    let myWallet = wallet(walletLength)
    var sum: Int = 0
    for banknot in myWallet {
        sum += banknot
    }
    return sum
}

sumWallet(walletLength: 10, wallet: generateWallet)


// рекурсия - это функция, которая вызывает сама себя. Нужно быть осторожным в ее реализации, так как она требует чтобы из нее бы выход


func countdown(firstNum num: Int) {
    print(num)
    if num > 0 {
        countdown(firstNum: num - 1)
    }
}

countdown(firstNum: 29)





//: [Next](@next)
