//: [Previous](@previous)

import Foundation

// String - это упорядоченная коллекция, каждый элемент которой представлен типом Сharacter

var str = "Hello"
str.count

// Так как String это коллекция, то отдельным ее элементом является Character, который может быть представлен с помощью юникод-скаляра \u{} включающий кодовую точку

let char: Character = "\u{E9}"

let anotherChar: Character = "\u{65}\u{301}" // комбинированный символ, состоящий из двух кодовых точек. Второй символ является модифицирующим символом (знак ударения) для первого

char == anotherChar

// Графем-кластер - этов совокупность юникод-скаляров (или кодовых точек), при визуальном представлении выглядящих как один символ. Грфаем кластер может состоять как из одного, так и из двух юникод-скаляров.

let thumbsUp = "\u{1f44d}"
let blackSkin = "\u{1f3fd}"
let combine = "\u{1f44d}\u{1f3fd}"

let cafeSimple = "caf\u{E9}"
let cafeCombine = "cafe\u{301}"
cafeSimple.count
cafeCombine.count

// Строковые индексы

let name = "e\u{301}lastic"
let index = name.startIndex
type(of: index)

let firstChar = name[index]
type(of: firstChar)

// startIndex - возвращает первый символ коллекции (неважно является он составным или нет)
// endIndex - возвращает индекс следующий сразу за последним

let indexLastChar = name.endIndex
//name[indexLastChar]

let lastCharIndex = name.index(before: indexLastChar)
name[lastCharIndex]

let secondCharIndex = name.index(after: index)
name[secondCharIndex]

// метод (_:offsetBy:) опзволяет получить требуемый символ с учетом отсупа (отступ вправо, указывается цеолочисленное значение)

let fourCharIndex = name.index(index, offsetBy: 3)
name[fourCharIndex]

name.count
name.unicodeScalars.count

// метод unicodeScalar.count учитывает каждый юникод скалар (каждую кодовыую точку)

// Substring
// подстрока ссылается на ту же область памяти что и исходная строка

let abc = "abcdefghjklmnopqrstuvwxyz"
let firstCharIndex = abc.startIndex
let fourCharacterIndex = abc.index(firstCharIndex, offsetBy: 3)
var subString = abc[firstCharIndex...fourCharacterIndex]
type(of: subString)

type(of: String(subString))

let subStr = abc[fourCharacterIndex...]
subStr









//: [Next](@next)
