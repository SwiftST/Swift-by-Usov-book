//: [Previous](@previous)

import Foundation

// Тип. Класса - это ссылочный тип (reference type). Экземпляры класса передаются по ссылкам, а не копированием

// Изменяемость - экземпляр класса может изменять значения сових свойств объявленных в классе как переменная, даже если сам экзепляр хранится в константе. Использование ключевого слово mutating для методов не требуется

// Наследование. Два класса могут быть в отношении "родительский - дочерний" друг к другу. При этом подкласс наследует и включает в себя все характеристики (свойства и методы) суперкласса и при необходимости может быть дополнительно расширен

// Инициализатор - класс не имеет автоматического инициализатора. По умолчанию есть пустой инициализатор

// Деинициализатор - Swift позволяет создать денициализатор - специальный метод, который автоматически вызывается при удалении экземпляра класса

// Приведение типов - в процессе выполнения программы вы можете проверить экземпляр класса на соответствие определенному типу данных

// Синтаксис классов

/*
class NameClass {
    // свойства и методы класса
}
*/

class Chessman {
    // тип фигуры
    let type: String
    // цыет фигуры
    let color: String
    // координаты фигуры
    var coordinates: (String, Int)? = nil
    // символ соответствующей фигуре
    let figureSymbol: Character
    
    // инициализатор
    init(type: String, color: String, figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
    }
}

//var kingWhite = Chessman(type: "king", color: "white", figure: "\u{2654}")

// Свойства type и color могут принять значения из четко определенного перечня, поэтому имеет смысл реализовать два перечисления: одно должно содержать типы шахматных фигур, второе — цвета

// тип шахматной фигуры
enum ChessmanType {
    case king, castle, bishop, pawn, knight, queen
}
// цвет фигур
enum ChessmanColor {
    case white, black
}

class ChessmanOne {
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    init(type: ChessmanType, color: ChessmanColor, coordinates: (String, Int), figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
        setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    // установка координат
    func setCoordinates(char c: String, num n: Int) {
        coordinates = (c, n)
    }
    // взятие фигуры
    func kill() {
        coordinates = nil
    }
}

var kingWhite = ChessmanOne(type: .king, color: .white, figure: "\u{2654}")
kingWhite.setCoordinates(char: "E", num: 2)

var queenBlack = ChessmanOne(type: .queen, color: .black, coordinates: ("A", 6), figure: "\u{2655}")

// класс может содержать произвольное количесвто инициализаторов, различающимися лишь набором входных элементов






//: [Next](@next)
