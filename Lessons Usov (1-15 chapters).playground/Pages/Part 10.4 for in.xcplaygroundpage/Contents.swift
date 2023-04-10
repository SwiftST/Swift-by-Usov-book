//: [Previous](@previous)

import Foundation

var countriesAndBlocks = [
    "Россия": "СНГ",
    "Франция": "ЕС"
]
for (countryName, orgName) in countriesAndBlocks {
    print("\(countryName) вступила в \(orgName) ")
}

for (countryName, _) in countriesAndBlocks {
    print(countryName)
}

for (_, orgName) in countriesAndBlocks {
    print(orgName)
}

for country in countriesAndBlocks.keys {
    print(country)
}

for orgName in countriesAndBlocks.values {
    print(orgName)
}


// enumerated - позволяет использовать индекс и значение массива при переборе
print("Some facts about me")
let myMusicStyles = ["Rock", "Jazz", "Rap"]
for (index, musicName) in myMusicStyles.enumerated() {
    print("\(index + 1). I love \(musicName)")
}


// Функция stride(from:through:by) - возвращает последовательность числовых элементов начиная с from до through с шагом by)

for i in stride(from: 1, through: 10, by: 3) {
    print(i)
}

// Функция stride(from:to:by) - имеет одно отличие вместо входного through используется to, который исключает указанное в нем значение из последовательности

for i in stride(from: 1, to: 10, by: 3) {
    print(i)
}

//В листинге 10.48 приведен пример вычисления суммы всех нечетных чисел от 1 до 1000 с помощью функции stride(from:through:by:).


var sumInt = 0
for i in stride(from: 1, through: 1000, by: 2) {
    sumInt += i
}
sumInt

// Использование where в конструкции for-in

// найти сумму только нечетных значений в диапозоне от 0 до 10

var sum = 0
for i in 1...10 where i % 2 == 1 {
    sum += i
}
sum

// многомерные коллекции в конструкции for-in

/*
 объявляется словарь, содержащий результаты игр одной хок- кейной команды в чемпионате. Ключ каждого элемента — это название команды соперника, а значение каждого элемента — массив результатов ее игр. На консоль выводятся результаты всех игр с указанием команд и итогового счета.
 */

let resultsOfGames = [
    "Spartac": ["0 : 5", "1 : 3"],
    "Dinamo": ["1: 1", "2 : 1"],
    "Zenit": ["0 : 3", "3 : 2"]
]

for (nameComand, results) in resultsOfGames {
    for result in results {
        print("\(nameComand) - \(result)")
    }
}

// использование continue в конструкции for-in

for i in 1...10 {
    if i % 2 == 0 {
        continue
    }
    print(i)
}

// использование break в конструкции for-in

for i in 1... {
    let randomNumber = Int.random(in: 0...100)
    if randomNumber == 5 {
        print("Для того чтобы выпало 5 потребовалось \(i) итераций")
        break
    }
}

for i in 1... {
    let randomNumber = Array<Int>(0...100).randomElement()
    if randomNumber == 5 {
        print("для того чтобы выпало число 5 потребовалось \(i) итераций")
        break
    }
}

/*
 Также вы можете использовать оператор break, чтобы прервать выполнение внешнего цикла. Для этого в Swift используются метки
 */
mainLoop: for i in 1...5 {
    for y in i...5 {
        if y == 4 && i == 2 {
            break mainLoop
        }
        print("\(i) - \(y)")
    }
}


//: [Next](@next)
