//: [Previous](@previous)

import Foundation

/*
Задание 1

Реализуйте структуру Point, описывающую точку на плоскости (2 оси)
Структура должна обладать следующими характеристиками:
— свойство, описывающее координаты очки на плоскости
— метод, принимающую другую точку в качестве входного аргумента и возвращающий расстояние между текущей точкой и переданной
Проверьте работоспособность вашей структуры
Расстояние между точками с координатам (10,20) и (15,22) должно быть равно [Double] 5.385164807134504

*/

struct Point {
    let point: (Double, Double)
    
    func distance(_ pointTwo: (Double, Double)) -> Double {
        sqrt(pow(pointTwo.0 - point.0, 2) + pow(pointTwo.1 - point.1, 2))
    }
}
let point = Point(point: (10, 20))
let distance = point.distance((15, 22))


/*
Задание 2

Ранее мы уже моделировали с вами сущность шахматная фигура с помощью перечисления Chessman. В этот раз мы смоделируем фигуру с помощью структуры, значительно расширив возможности данной модели. Вы конечно же можете использовать наработки из заданий главы «Перечисления».
1) Создайте перечисление Color, которое будет содержать два члена, описывающих цвета фигур. Для каждого члена укажите связанное значение, определяющее наименование цвета на английском языке
2) Создайте перечисление Type, членами которого будут являться шахматные фигуры. Для каждого члена укажите связанное значение, определяющее наименование фигуры на английском языке
3) Объявите две переменные. Первой инициализируйте член перечисления Color, а второй — Type
4) Создайте структуру Chessman, которая описывает сущность «шахматная фигура».
Перечисление должно содержать следующие элементы:
— свойство color типа Color, определяющее цвет фиугры
— свойство type типа Type, определяющее тип фигуры
— свойство coordinates типа (Character, UInt)?, определяющее координаты фигуры на шахматной доске.
— свойство symbol, определяющее UTF-символ данной шахматной фигуры (тип Character)
— инициализатор, принимающий значения свойств color и type, и устанавливающий coordinates в nil, а symbol в ""
— инициализатор, принимающий на вход значения для всех свойств: color, type, coordinates, symbol
— метод setCoordinates(Character,UInt), позволяющий установить новые координаты фигуры
— метод kill(), сменяющий координаты на nil (убивающий фигуру)
5) Объявите переменную whiteKing и инициализируйте ей значение типа Chessman, описывающее фигуру «Белый король». Попробуйте использовать каждый из созданных методов структуры.

*/

struct Chessman {
    enum Color {
        case white, black
    }
    enum ChessmanType {
        case king, queen, horse, elephant, rook, pawn
    }
    
    var type: ChessmanType
    var color: Color
    var coordinates: (char: Character, num: UInt)? = nil
    var symbol: Character = "?"
    
    init(type: ChessmanType, color: Color) {
        self.type = type
        self.color = color
    }
    
    init(type: ChessmanType, color: Color, coordinates: (Character, UInt), symbol: Character) {
        self.type = type
        self.color = color
        setCoordinates((coordinates.0, coordinates.1))
        self.symbol = symbol
    }
    
    mutating func setCoordinates(_ coordinate: (Character, UInt)) {
        coordinates = coordinate
    }
    
    mutating func kill() {
        coordinates = nil
    }
    
}

var whiteKing = Chessman(type: .king, color: .white)
whiteKing.coordinates
whiteKing.setCoordinates(("A", 3))
whiteKing.coordinates
whiteKing.symbol
whiteKing.symbol = "♔"
whiteKing.symbol
whiteKing.kill()
whiteKing.coordinates


 
/*
Задание 3

1) Cоздайте структуру, описывающую сущность «Пользователь». В ее состав должны входить следюущие элементы:
— свойства, содержащие имя и фамилию
— инициализатор, принимающий только имя
— инициализатор, принимающий имя и фамилию
— метод, возвращающий информационную строку с указание имени и фамилии пользователя
— методы, изменяющие имя и фамилию
2) Проверьте созданную структуру
*/

struct User {
    var name = "Name"
    var surname: String = "Last name"
    
    init(name: String) {
        changeName(name)
    }
    
    init(name: String, surname: String) {
        changeName(name)
        changeSurname(surname)
    }
    
    func getDescription() -> String {
        "\(name) \(surname)"
    }
    
    mutating func changeName(_ name: String) {
        self.name = name
    }
    
    mutating func changeSurname(_ surname: String) {
        self.surname = surname
    }
}
var user = User(name: "Pavel")
user.getDescription()
user.changeName("Ivanov")
user.getDescription()
user.changeSurname("Ivan")
user.getDescription()


//В чем принципиальное и самое важное отличие класса от структуры? Приведите пример, демонстрирующий ваш ответ.

// Класс - ссылочный тип. Экземпляры класса передаются по ссылке, Структура это value type. Экземпляры структуры передаются копированием (каждый раз создается новый экземпляр не зависящий от предыдущего)
class SomeClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
var instanceCl = SomeClass(name: "Pavel")
var someInstanceCl = instanceCl
instanceCl === someInstanceCl
someInstanceCl.name = "Ivan"
instanceCl.name

// У класса отсутствует автоматический инициализатор, у структуры есть
// У класса есть деинициализатор, у структуры нет
// Класс может наследовать свои свойства и методы дочернему классу
// В структуре если метод изменяет свойства структуры перед словом func должно быть указано ключевое слово mutating





//: [Next](@next)
