//: [Previous](@previous)

import Foundation

/*
Задание 1

Расширьте класс Int, добавив в него свойства asDouble, asFloat и asString, возвращающие исходное целое число в преобразованном к другому типу данных виде (к Double, к Float, к String)
Пример
[Int] 12.asDouble -> [Double] 12

*/

extension Int {
    var asDouble: Double {
        return Double(self)
    }
    var asFloat: Float {
        return Float(self)
    }
    var asString: String {
        return String(self)
    }
}

let a = 2.asFloat
type(of: a)

 
/*
Задание 2

Напишите расширение к классу String, которое содержит метод, возвращающий закодированную строку по следующим правилам:
— Первый символ каждого слова в строке меняется на Кодовую точку (набор цифр) данного символа в UTF
— второй символ в каждом слове меняется местами с последним
Пример
"Я учу Swift".crypt() -> "1071 1091уч 83tifw"
кодовые точки в данном случае представлены в десятиричной системе счисления

Swift обладает большим количеством встроенных функций и методов.
Для того, чтобы разделить строку на подстроки по определенному разделителю
можно использовать метод split(separator:), который возвращает массив
типа [Substring].
Пример
"Я учу Swift".split(separator:" ") -> ["Я", "учу", "Swift"]
✕
*/

// first variant
extension String {
    mutating func crypt() {
        guard !self.isEmpty else {
            return
        }
        let arrayString = self.split(separator: " ").map { sub in
            var result = ""
            let firstChar = String(sub.first!.asciiValue!)
            switch sub.count {
            case 4...:
                result.append(contentsOf: sub[sub.index(sub.startIndex, offsetBy: 2)..<sub.index(sub.endIndex, offsetBy: -1)])
                fallthrough
            case 3:
                result.append(contentsOf: String(sub[sub.index(sub.startIndex, offsetBy: 1)]))
                fallthrough
            case 2:
                result.insert(contentsOf: String(sub.last!), at: result.startIndex)
                fallthrough
            case 1:
                result.insert(contentsOf: firstChar, at: result.startIndex)
            default:
                break
            }
            return result
        }
        self = arrayString.joined(separator: " ")
    }
}

var sub = "I learn Swift"
sub.crypt()

// Second variant (by Usov)
//После разделения на подстроки можно обрабатывать каждую строку отдельно
/*
extension String {
    func crypt() -> String{
        let strArr = self.split(separator:" ")
        var resultStr = ""
        for w in strArr {
            // Преобразуем Substring в String
            var word = String(w)
            // в первую очередь меняем второй и последний символ местами
            // это актуально только для тех слов, в которых 3 и более символов
            if word.count >= 3 {
                // получаем индекс второго символа
                let secondCharIndex = word.index(after: word.startIndex)
                // записываем второй символ во временную переменную
                let tmp_secondChar = word[secondCharIndex]
                // получаем индекс последнего символа
                let lastCharIndex = word.index(before: word.endIndex)
                // меняем местами символы
                word.replaceSubrange(
                    secondCharIndex..<word.index(after: secondCharIndex),
                    with: String(word[lastCharIndex]))
                word.replaceSubrange(
                    lastCharIndex..<word.index(after: lastCharIndex),
                    with: String(tmp_secondChar))
            }
            //заменяем первый символ на его кодовую точку
            //Обратите внимание на то, что кодовая точка в данном случае представлена в
            //10-ричной системе счисления. В то время как для вставки симвоал в строку с помощью
            //конструкции \u{} используется шестнадцатиричная система
            let codePoint = word.unicodeScalars[word.startIndex].value
            word.replaceSubrange(
               word.startIndex..<word.index(after: word.startIndex),
               with: String(codePoint))
            resultStr += "\(word) "
        }
        //удаляем последний лишний пробел
        resultStr.remove(at: resultStr.index(before: resultStr.endIndex))
        //возвращаем результат
        return resultStr
    }
}
*/


/*
Задание 3

Ваша программа оперирует числовыми данными, характеризующими расстояние. При это вам необходимо работать исключительно с сантиметрами, но данные могут быть указаны и в любых других единицах измерения (миллиметрах, метрах, километрах)
Напишите расширение для структуры Double, добавляющее в тип свойства, с помощью которых можно перевести указанную длину в сантиметры следующим образом:

Double(102).m //10200
1.2.km //120000
900.sm //900
Свойство указывает в каких единицах определено расстояние, и переводит его в сантиметры

Задание 4

В дополнении к предыдущему заданию напишите расширение для структуры Double, чтобы оно позволяло переводить число из сантиметров в миллиметры, сантиметры, метры, километры, используя следующий синтаксис:

100.1.toM // 1.001
Double(5).km.toM // 5000
Double(150).m.toKM // 0.15
*/

extension Double {
    var m: Double {
        self * 100
    }
    var km: Double {
        self * 100_000
    }
    var sm: Double {
        self
    }
    var toMil: Double {
        self * 10
    }
    var toKm: Double {
        self / 100_000
    }
    var toM: Double {
        self / 100
    }
}

Double(102).m
1.2.km.toM
900.sm.toMil


/*
Задание 5

Напишите расширение для типа Int, добавляющее в него метод iterator(count:closure:), принимающий два параметра:
— count — количество раз, которые необходимо повторить переданное замыкание
— замыкание, модифицирующее значение типа Int

К примеру:

//3 раза умножить число 2 на 5
var a = 2
a.iterator(count: 3) {$0 * 5}
a // 250
*/

extension Int {
    mutating func iterator(count: Int, _ closure: (Int) -> (Int)) {
        for _ in 1...count {
            self = closure(self)
        }
    }
}
var number = 2
number.iterator(count: 3) { $0 * 5 }
number


/*
Задание 6

Напишите расширение для типа Int, которое добавляет сабскрипт, возвращающий указанную в числе цифру или nil, если цифры с таким порядковым номером не существует
Например:

54[1] //5
98[-2] // nil
113[3] //3
34[4] //nil
 */

// First variant
//extension Int {
//    subscript(number: Int) -> Int? {
//        guard number > 0 else {
//            return nil
//        }
//        var temp = self
//        var count = 1
//
//        while temp > 0 {
//            temp /= 10
//            if temp > 0 {
//                count += 1
//            }
//        }
//        guard number <= count else {
//            return nil
//        }
//        temp = self
//
//        for _ in 0..<(count - number) {
//            temp /= 10
//        }
//        return temp % 10
//
//    }
//}

// Final variant

extension Int {
    subscript(number: Int) -> Int? {
        guard number > 0, String(self).count >= number else {
            return nil
        }
        var temp = self
        for _ in 0..<(String(self).count - number) {
            temp /= 10
        }
        return temp % 10
    }
}

54[1] //5
98[-2] // nil
113[3] //3
34[4] //nil


//: [Next](@next)
