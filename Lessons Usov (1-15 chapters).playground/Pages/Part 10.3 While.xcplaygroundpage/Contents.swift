//: [Previous](@previous)

import Foundation

// Циклы While and Repeat While

// while - это цикл с предварительной проверкой условия и если условие true программа перейдет в тело цикла, если false то код внутри цикла будет проигнорирован

var i = 1
var resultSum = 0
while i <= 10 {
    resultSum += i
    i += 1
}
resultSum

// repeat while - цикл, в котором проверка условия идет сразу после тела цикла, соответственно даже если условие false выражение в теле цикла выполнится один раз

var y = 1
var result = 0
repeat {
    result += y
    y += 1
} while y <= 10
result

// Использование оператора continue

// Оператор continue предназначен для перехода к очередной итерации, игнорирую следующий за ним код

var x = 0
var sum = 0
while x <= 10 {
    x += 1
    if x % 2 == 1 {
        continue
    }
    sum += x
}
sum

// Использование оператора break

// Оператор break - предназначен для досрочного завершения цикла

/*
 как производится подсчет суммы всех чисел от 1 до 54. При этом если сумма достигает 450, то происходит выход из оператора и выводится соответствующее сообщение.
 */
var lastNum = 54
var currentNum = 1
var sumOfInts = 0

while currentNum <= lastNum {
    sumOfInts += currentNum
    if sumOfInts > 450 {
        print("sum > 450. Last number = \(currentNum)")
        break
    }
    currentNum += 1
}
sumOfInts

//: [Next](@next)
