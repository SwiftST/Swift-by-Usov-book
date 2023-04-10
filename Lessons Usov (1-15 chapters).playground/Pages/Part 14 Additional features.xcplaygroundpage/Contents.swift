//: [Previous](@previous)

import Foundation

// Метод map(_:) - позволяет применить переданное в него замыкание для каждого элемента коллекции. В результате его выполнения возвращается новая коллекция тип которой может отличаться от исходной

let myArray = [2, 4, 5, 7]
var newArray = myArray.map { $0 } // сокрпщенная форма записи
newArray = myArray.map { (value: Int) -> Int in
    return value
}

// выведем в новую коллекцию, элементы возведенные в квадрат

newArray = myArray.map { $0 * $0 }
newArray

// тип результирующий коллекции может отличаться от исходной

let boolArray = myArray.map { $0 > 2 }
boolArray

// пример создание многомерного массива
let numbers = Array(1...4)
let mapped = numbers.map { Array(repeating: $0, count: $0 ) }
mapped

// метод map(_:) позволяет обрабатывать элементы любой коллекции в том числе и словаря

let milesToDest = [
    "Moscow": 120.0,
    "Dubai": 50.0,
    "Paris": 70.0
]

let kmToDest = milesToDest.map { [$0: $1 * 1.6093] }
type(of: kmToDest)
kmToDest

// Method mapValues(_:) - позволяет обработать значения каждого элемента словаря при этом ключи останутся в исходнос состоянии

let kmToDestOne = milesToDest.mapValues { $0 * 1.6093 }
kmToDestOne

// Method flatMap(_:) - отличается от map(_:) тем что всегда возвращает плоский одномерный массив. Так пример приведенный выше вернет одномерный массив

let numbersArray = Array(1...4)
let flatMapped = numbersArray.flatMap { Array(repeating: $0, count: $0) }
flatMapped

// вся мощь flatMap(_:) проявляется тогда, когда в многомерном массиве требуется найти все попадающие под некоторое условие значения

let someArray = [
    [1, 2, 3, 4, 5],
    [11, 44, 1, 6],
    [16, 403]
]
let filterSomeArray = someArray.flatMap { $0.filter { $0 % 2 == 0 } }
filterSomeArray


// Method compactMap(_:) - позволяет произвести те же действия что и метод map(_:) разница лишь в реакции на преобразование, когда оно не может быть пройдено

let stringArray = ["1", "2", "3", "four", "5"]
var intFromStringArray = stringArray.map { Int($0) }
intFromStringArray
type(of: intFromStringArray)
intFromStringArray.append(nil)

// метод map(_:) при неудачном преобразовании String в Int  записывает в результирующий массив nil
// метод compactMap(_:) игнорируют неудачные преобразования и в их случае ничего не записывает в результирующую коллекцию

let arrayWithoutNil = stringArray.compactMap { Int($0) }
arrayWithoutNil
type(of: arrayWithoutNil)

// Method filter(_:) - используется когда необходимо отфильтровать элементы коллекции по определенному правилу

let numArray = [1, 4, 10, 15]
let even = numArray.filter { $0 % 2 == 0 }
even

// помимо массивов можно производить фильтрацию других типов коллекций

let starDistanceDict = [
    "Wolf": 7.78,
    "Alpha Centauri": 4.47,
    "Happy Star": 5.96
]

let closeStars = starDistanceDict.filter { $0.value < 5.0 }
closeStars

// Method reduce(_:_:) - позволяет объеденить все элементы коллекции в одно значение в соответствии с переданным замыканием. Помимо самиз элементов метод принимает первоначальное значение, которое служит для выполнения операции с первым элементом коллекции

let cash = [10, 50, 100, 500]
let total = cash.reduce(210, +)

// первый аргумент это первоначальное значение с которым будут производиться дальнейшие операции, второй - это замыкание, обрабатывающий каждую пару элементов

// замыкание производящее операцию может быть произвольным - главное чтобы оно обрабатывало операцию для двух входящих параметров

let multiTotal = cash.reduce(210) { partialResult, nextValue in
    partialResult * nextValue
}
let totalThree = cash.reduce(210) { $0 - $1 }
totalThree


// Method zip(_:_:) - метод который предназначен для формирования последовательности пар значений, каждая из которых составлена из элементов двух базовых последовательностей. Если есть две последовательности и вам нужно попарно брать их элементы группирровать и складывать в новую последовательность то этот метод как раз то что нужно

let collectionOne = [1, 2, 3]
let collectionTwo = [4, 5, 6]
let zipSequence = zip(collectionOne, collectionTwo)
type(of: zipSequence)
// генерация массива из сформированной последовательности
let anotherArray = Array(zipSequence)
type(of: anotherArray)
// генерация словаря на основе последовательности пар значений
let newDictionary = Dictionary(uniqueKeysWithValues: zipSequence)
type(of: newDictionary)

// Оператор отложенных действий defer - откладывает выполнение определенного кода до момента выхода из области видимости, в которой он был использован (например после окончания функции)

func someFunction() {
    defer {
        print("action in defer")
    }
    defer {
        print("another action in defer")
    }
    print("action in function")
}
someFunction()

// как видно из примера выше отложенные действия были выполнены после того как функция завершила свою работу и что важно они выполнялись в обратном порядке: сперва блок последнего оператора defer, затем предпоследнего и т.д.






//: [Next](@next)
