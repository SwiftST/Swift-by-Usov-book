//: [Previous](@previous)

import Foundation

let rangeInt = 1..<5
type(of: rangeInt)


let rangeString = "a"..<"z"
type(of: rangeString)

let rangeCharacter: Range<Character> = "a"..<"z"
type(of: rangeCharacter)

let rangeDouble = 1.0..<5.0
type(of: rangeDouble)

let myRange = ..<500
type(of: myRange)

let fullRange = 1...10
type(of: fullRange)

let infRange = 2...
type(of: infRange)
let collection = [1, 6, 76, 12, 51]
print(collection[infRange])

let anotherIntR = 20..<34
anotherIntR.lowerBound
anotherIntR.upperBound
anotherIntR.min()
anotherIntR.max()




let intR = 1...10
intR.count

let floatR: ClosedRange<Float> = 1.0...2.0
floatR.contains(0)

let emptyR = 0..<0
emptyR.count
emptyR.isEmpty

let notEmptyR = 0...0
notEmptyR.count
notEmptyR.isEmpty

/*
 Range<T>, например 1..<5
 ClosedRange<T>, 1...10
 PartialRangeToUp<T>, ..<3
 PartialRangeFrom<T>, 10...
 PartialRangeThrouth<T>, ...3
 
 T - тип данных элементов диапазона
 */

let rangeOne = ...10
type(of: rangeOne)
let rangeTwo = ..<10
type(of: rangeTwo)

//let range = UInt8(1)...
//for i in range {
//    print(i)
//}

// Диапазоны ограниченные с обоих сторон, являются хэшируемыми

let range1 = 1...10
range1.hashValue
let range2 = 1..<10
range2.hashValue

//  где используют диапазоны
/*
 При переборе в циклах.
 for iteratorItem in 1…100 { ... }
 • При указании на числовой диапазон.
 let successValuesRange = 0.0..<5.0
 // проверим, входит ли некоторое значение в данный диапазон
 successValuesRange.contains(7.2) // false
 • При создании массива.
 Array(1...4) // [1, 2, 3, 4]
 • При получении требуемых элементов массива.
 let array: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
 array[..<5] // [0, 1, 2, 3, 4]
*/



//: [Next](@next)

