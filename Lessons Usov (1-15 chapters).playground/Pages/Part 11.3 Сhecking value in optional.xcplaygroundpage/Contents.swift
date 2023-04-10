//: [Previous](@previous)

import Foundation

// Для проверки наличия значения в опционале его можно сравнить с nil

let optOne: UInt? = nil
let optTwo: UInt? = 8

optOne != nil
optTwo != nil

// подобную проверку можно использовать с оператором if. Если в опционале есть значение, то в теле оператора оно может быть извлечено без ошибок

// пример, в котором определяется количество положительных оценок, а точнее пятерок. Если пятерки есть, то вычисляется количество пирожных, которые необходимо приобрести в награду за старания.

var fiveMarkCount: Int? = 8
var allCakesCount = 0

if fiveMarkCount != nil {
    let cakeForEachFiveMark = 2
    allCakesCount = fiveMarkCount! * cakeForEachFiveMark
}
allCakesCount

// Данный способ проверки существования значения опционала применим только при force unwrapping, так как implicitly unwrapping value нем может быть равно nil





//: [Next](@next)
