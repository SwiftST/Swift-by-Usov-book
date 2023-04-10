//: [Previous](@previous)

import Foundation

// вложенные в класс типы
// если классы перечисления или структуру расширяющие возможности и функционал класс нужны только в пределах классах, можно обявить их внутри класса

class Chessman {
    // тип шахматной фигуры
    enum ChessmanType {
        case king, castle, bishop, pawn, knight, queen
    }
    // цвет фигур
    enum ChessmanColor {
        case white, black
    }
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

// ссылки на вложенные типы
let linkToEnumValue = Chessman.ChessmanType.bishop
type(of: linkToEnumValue)




//: [Next](@next)
