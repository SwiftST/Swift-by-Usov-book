//: [Previous](@previous)

import Foundation

// guard - оператор досрочного выхода, тело которого выплняется, если условия false. Если условие возвращает true тело оператора игнорируется и и управление переходит к следующему за guard коду.

// Для данного оператора существует ограничение: его тело должно содержать один из следующих операторов — return, break, continue, throw.
/*
 Синтаксис:
 guard проверяемое_условие else {
    тело оператора
 }
 
 */

// guard для опционалов

// example - определение количества сторон геометричекой фигуры
func countSidesShape(shape: String) -> Int? {
    switch shape {
    case "треугольник":
        return 3
    case "прямоугольник":
        fallthrough
    case "квадрат":
        return 4
    default:
        return nil
    }
}

//func maybePrinCountSides(shape: String) {
//    if let sides = countSidesShape(shape: shape) {
//        print("Фигура \(shape) имеет \(sides) стороны")
//    } else {
//        print("Yеизвсетная фигура")
//    }
//}


func maybePrintCountSides(shape: String) {
    guard let sides = countSidesShape(shape: shape) else {
        print("Неизвестная фигура")
        return
    }
    print("эта фигура \(shape) он имеет \(sides) сторон")
}
maybePrintCountSides(shape: "g")

//: [Next](@next)
