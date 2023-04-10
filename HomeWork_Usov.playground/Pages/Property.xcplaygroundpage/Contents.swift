//: [Previous](@previous)

import Foundation

/*
Задание 1

1) Создайте класс RandomNumberGenerator, которы будет возвращать случайно сгенерированное число. Его инициализатор должен принимать свойства min и max, ограничивающие диапазон возможных значений сверху и снизу (максимальное и минимальное значения). Так же у класса должен быть метод getNumber(), возвращающий случайное целое число (из диапазона min...max).
 */
class RandomNumberGenerator {
    var min: Int {
        willSet {
            print("Будет установлено min \(newValue) вместо \(min)")
        }
        didSet {
            if min > max {
                print("Incorrect value. Value max(\(max)) < min(\(min))")
                min = oldValue
            }
        }
    }
    var max: Int {
        willSet {
            print("Будет установлено max \(newValue) вместо \(max)")
        }
        didSet {
            if min > max {
                print("Incorrect value. Value max(\(max)) < min(\(min))")
                max = oldValue
                
            }
        }
    }
    
    init(min: Int, max: Int) {
        (self.min = min, self.max = max)
    }
    
    func getNumber() -> Int {
        guard min <= max else {
            return 0
        }
        return Int.random(in: min...max)
    }
}

let randomNumber = RandomNumberGenerator(min: 12, max: 11)
randomNumber.getNumber()
randomNumber.max = 111
randomNumber.min = 112
randomNumber.min
/*
2) Создайте структуру Employee, содержащее три свойства:

firstName — имя работника
secondName — фамилия работника
salary — заработная плата
Типы данных свойств определите самостоятельно
 */

struct Employee {
    var name: String
    var surname: String
    var salary: Int
}

/*
3) Создайте два массива типа [String] каждый. Первый должен содержать 5 вариантов имен, а второй — пять вариантов фамилий.
 */
let names = ["kim", "oleg", "darya", "petya", "sergey"]
let surnames = ["kardashyan", "abramovich", "miller", "gref", "smith"]

/*
4) Создайте экземпляр типа Employee. Значения имени и фамилии должны браться случайным образом из созданных в пункте 3 массивов. Значение заработной платы должно быть случайным целым числом в диапазоне от 20000 до 100000. Используйте созданный в шаге 1) класс RandomNumberGenerator.
 */
var randomName = RandomNumberGenerator(min: 0, max: names.count - 1).getNumber()
var randomSurname = RandomNumberGenerator(min: 0, max: surnames.count - 1).getNumber()
var randomSalary = RandomNumberGenerator(min: 20000, max: 100000).getNumber()

var employ = Employee(name: names[randomName], surname: surnames[randomSurname], salary: randomSalary)
employ.name
employ.surname
employ.salary


//: [Next](@next)
