//: [Previous](@previous)

import Foundation

// Сабскрипты используются для доступа к отдельным значениям коллекций по их индексу
// С помощью сабскриптов структуры и классы можно превратить в некое подобие коллекций. У вас есть возможность организовать доступ к свойствам экземпляра с использованием специальных ключей (индексов).
// сабскрипты объявляются в теле структуры или класса с помощью ключевого слова subscript
// сабскрипты поддерживают перегрузку, то есть в пределах одного объектного класса может быть объявленно произвольное количесво сабскриптов, различающимся лишь набором входных элементов
/*
 синтаксис
 subscript(input_values) -> Type_return_value {
    get {
        // body get
    }
    set(associativeValue) {
        // body set
    }
 }
 */

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

class GameDesk {
    var desk: [Int:[String: Chessman]] = [:]
    
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    // сабскрипт (get получение инфо по отдельной ячейке - установлена ли в ней фигура)
    subscript(alpha: String, num: Int) -> Chessman? {
        get {
            return self.desk[num]![alpha]
        }
        set {
            if let chessman = newValue {
                self.setChessman(chess: chessman, coordinates: (alpha, num))
            } else {
                self.desk[num]![alpha] = nil
            }
        }
    }
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."Z"
        // проверка переданных координат
        if rowRange.contains(coordinates.1) && colRange.contains(coordinates.0) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}
var game = GameDesk()
var queenBlack = Chessman(type: .queen, color: .black, coordinates: ("A", 6), figure: "\u{265B}")
game.setChessman(chess: queenBlack, coordinates: ("B", 2))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("A", 3))
game["A", 3]
game["C", 5] = queenBlack
game["C", 5]
game["A", 3]
game["A", 3] = nil
game["A", 3]


//: [Next](@next)
