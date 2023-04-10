//: [Previous](@previous)

import Foundation

var numbers = [2, 23, 33, 332, 1]

let newNumbers = numbers.map({ number in
    number % 2 == 0 ? number * 3 : 0
})

newNumbers

let newAlphabetArray = Array(arrayLiteral: "a", "b", "c")
newAlphabetArray

let someArray = Array(1...1)

Array(repeating: 1, count: 3)

var mutableArray = [2, 4, 5]
mutableArray[1] = 777
mutableArray[1...]
mutableArray[...1]

// Инициализация пустого массива

var emptyArray: [String] = []
var anotherEmptyArray = [String]()
var anotherEmptyArrayOne = Array<String>()
var anorherEmptyArrayTwo: Array<String> = []

emptyArray
anotherEmptyArray
anotherEmptyArrayOne
anorherEmptyArrayTwo

var someArray2 = [1, 2, 3]
someArray == [1, 2, 3]
someArray2 += someArray

// Многомерные массивы

var arrayOfArrays = [[1, 2, 3], [4, 5, 6,], [7, 8, 9]]

arrayOfArrays[0][...1]

arrayOfArrays.count
arrayOfArrays.isEmpty

var numArray = Array(1...5)
var sliceOfArray = numArray[numArray.count - 3...numArray.count - 1]
numArray.first
numArray.last

numArray.append(6)
numArray

numArray.insert(100, at: 0)
numArray.remove(at: 0)
numArray
numArray.removeFirst()
numArray
numArray.removeLast()
numArray

var nsdd = numArray.dropLast(2)
nsdd
nsdd = numArray.dropFirst()
numArray.contains(4...6)
numArray.min()
numArray.max()

numArray.reverse()
numArray.sorted(by: <)
numArray
numArray.sort()
numArray

numArray.randomElement()

// ArraySlice - срез массива, который является подмножеством исходного массива и ссылается на его часть. Даже после изменения/удаления исходного массива данные на которые сослался slice продолжают храниться в памяти

var integersArray = Array(1...10)
var slice = integersArray[2...5]
type(of: slice)
integersArray.removeAll()
integersArray
slice

var arrayFromSlice = Array(slice)
type(of: arrayFromSlice)
arrayFromSlice

// Функции dropLast/dropFirst возвращают ArraySlice однако если указать параметру в который мы записываем результат выполнения функции тип данных явно тип будет соответствовать указанному

integersArray = Array(1...10)
let newArray: Array<Int> = integersArray.dropLast()
type(of: newArray)


// Индексы ArraySlice соответствуют индексам исходной коллекции
var sliceTwo = integersArray[5...8]
sliceTwo[6]

//: [Next](@next)
