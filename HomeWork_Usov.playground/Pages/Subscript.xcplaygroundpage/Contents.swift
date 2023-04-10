//: [Previous](@previous)

import Foundation

/*
 Задание 1

 Измените сабскрипт таким образом, чтобы он корректно обрабатывал удаление фигуры с шахматной доски. Не забывайте, что у класса Chessman есть метод kill(). То есть должно происходить не просто удаление фигуры с поля, но и изменение свойства coordinates на nil у самой фигуры.
 2) Реализуйте метод printDesk() в классе gameDesk, выполняющий вывод на консоль изображения шахматной доски с помощью символов в следующем виде:
 // 1 _ _ _ _ _ _ _ _
 // 2 _ _ _ _ _ _ _ _
 // 3 _ _ _ _ _ _ _ _
 // 4 _ _ _ _ _ _ _ _
 // 5 _ _ _ _ _ _ _ _
 // 6 _ _ _ _ _ _ _ _
 // 7 _ _ _ _ _ _ _ _
 // 8 _ _ _ _ _ _ _ _
 //   A B C D E F G H
 При этом там, где располагаются созданные фигуры должны выводиться их графически отображения (значение свойства symbol класса Chessman).

 3) Доработайте классы таким образом, чтобы убитые фигуры (убранные с поля, значение координат изменено на nil) при использовании метода printDesk() появлялись над и под шахматной доской (над шахматной — черные фигуры), под шахматной — белые).
 4) Доработайте классы таким образом, чтобы появилась возможность изменить координаты фигуры на поле.
 Например:
 game.move(from:to:)
 5) Если вы чувствуете в себе силы, то реализуйте следующий функционал:
 — при попытке передвижения фигуры должна производиться проверка возможности ее перемещения. Попытайтесь реализовать хотя бы для одного типа фигур (к примеру пешка). При этом должны учитываться: особенности первого хода, будет ли съедена в результате хода фигура противника и т.д.

 Пример вывода:

 ♝♜
 1 _ _ _ _ _ _ _ _
 2 _ _ _ ♚ _ _ _ _
 3 _ _ _ _ _ ♛ _ _
 4 _ _ _ _ _ _ _ _
 5 _ _ _ _ _ _ _ _
 6 _ _ _ _ _ _ _ _
 7 _ _ _ ♔ _ _ _ _
 8 _ _ _ _ _ _ _ _
   A B C D E F G H
 ♙♘♕♖♗
 */

class Chessman {
    // тип шахматной фигуры
    enum ChessmanType {
        case king, rook, elephant, pawn, horse, queen
    }
    // цвет фигур
    enum ChessmanColor {
        case white, black
    }
    
    static var killsFigures: [Chessman] = []
    
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
        Self.killsFigures.append(self)
        coordinates = nil
    }
    
    func changePosition(to: (String, Int)) -> Bool {
        switch type {
        case .king:
            return goKing(to: to)
        case .queen:
            return goRook(to: to) || goElephant(to: to)
        case .elephant:
            return goElephant(to: to)
        case .rook:
            return goRook(to: to)
        case .pawn:
            return goPawn(to: to)
        case .horse:
            return goHorse(to: to)
        }
    }
    
    private func goKing(to: (String, Int)) -> Bool {
        if abs(Int(Character(coordinates!.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == 1 && coordinates!.1 == to.1 {
            return true
        } else if coordinates!.0 == to.0 && abs(coordinates!.1 - to.1) == 1 {
            return true
        } else if abs(Int(Character(coordinates!.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == 1 && abs(coordinates!.1 - to.1) == 1 {
            return true
        }
        return false
    }
    
    private func goElephant(to: (String, Int)) -> Bool {
        abs(Int(Character(coordinates!.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == abs(coordinates!.1 - to.1)
    }
    
    private func goRook(to: (String, Int)) -> Bool {
        (coordinates!.0 == to.0 && coordinates!.1 != to.1) ||
        (coordinates!.0 != to.0 && coordinates!.1 == to.1)
    }
    
    private func goHorse(to: (String, Int)) -> Bool {
        (abs(Int(Character(coordinates!.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == 1 && abs(coordinates!.1 - to.1) == 2) ||
        (abs(Int(Character(coordinates!.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == 2 && abs(coordinates!.1 - to.1) == 1)
    }
    
    private func goPawn(to: (String, Int)) -> Bool {
        switch color {
        case .white where coordinates!.0 == to.0 && to.1 - coordinates!.1 == 1:
            return true
        case .black where coordinates!.0 == to.0 && to.1 - coordinates!.1 == -1:
            return true
        default:
            return false
        }
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
                let chess = self.desk[num]![alpha]
                chess!.kill()
                self.desk[num]![alpha] = nil
            }
        }
    }
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."H"
        // проверка переданных координат
        if rowRange.contains(coordinates.1) && colRange.contains(coordinates.0) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
    
    func moveTo(chess: Chessman, coordinates: (String, Int)) {
        // проверка установлена ли фигура на поле
        guard let _ = chess.coordinates else {
            print("Фигура отсутствует на поле")
            return
        }
        let rowRange = 1...8
        let colRange = "A"..."H"
        // проверка переданных координат
        guard rowRange.contains(coordinates.1) && colRange.contains(coordinates.0) else {
            print("Coordinates out of range")
            return
        }
        guard chess.changePosition(to: coordinates) else {
            print("\(chess.type)\(chess.color) так не ходит")
            return
        }
        guard let someChess = desk[coordinates.1]![coordinates.0] else {
            self.desk[chess.coordinates!.1]![chess.coordinates!.0] = nil
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
            return
        }
        guard someChess.color != chess.color else {
            print("Недопустимый ход. Своих брать нельзя")
            return
        }
        print("\(someChess.type)\(someChess.color) взят")
        someChess.kill()
        self.desk[chess.coordinates!.1]![chess.coordinates!.0] = nil
        self.desk[coordinates.1]![coordinates.0] = chess
        chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        
    }
    
    func printDesk() {
        Chessman.killsFigures.filter {
            if $0.color == .black {
                print($0.figureSymbol, terminator: "")
            }
            return false
        }
        print("")
        for i in desk.keys.sorted(by: > ) {
            print(i, terminator: " ")
            for (n, j) in "ABCDEFGH".enumerated() {
                guard let figure = desk[i]![String(j)] else {
                    (i + n) % 2 == 0 ? print("□", terminator: " ") : print("■", terminator: " ")
                    continue
                }
                print(figure.figureSymbol, terminator: " ")
            }
            print("")
        }
        print("  A B C D E F G H")
        Chessman.killsFigures.filter {
            if $0.color == .white {
                print($0.figureSymbol, terminator: "")
            }
            return false
        }
    }
}

var game = GameDesk()
var queenBlack = Chessman(type: .queen, color: .black, coordinates: ("A", 6), figure: "\u{265B}")
var kingBlack = Chessman(type: .king, color: .black, coordinates: ("H", 7), figure: "♚")
var whiteKing = Chessman(type: .king, color: .white, coordinates: ("B", 5), figure: "♔")
game["B", 8] = kingBlack
game.moveTo(chess: kingBlack, coordinates: ("C", 7))
game.printDesk()
game["B", 8]
game["H", 2] = whiteKing
game["C", 5] = queenBlack
game.moveTo(chess: queenBlack, coordinates: ("C", 2))
game.moveTo(chess: queenBlack, coordinates: ("H", 2))
game.printDesk()



//: [Next](@next)
