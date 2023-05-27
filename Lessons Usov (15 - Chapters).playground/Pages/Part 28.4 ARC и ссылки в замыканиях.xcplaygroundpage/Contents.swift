//: [Previous](@previous)

import Foundation

// Automatic Reference Counting (ARC) - это специальный механизм автоматического подсчета ссылок. Именно он подсчитывал количество входящих сильных ссылок на каждый объект и при возможности удалял неиспользуемые экземпляры.
// Как только последняя ссылка на экземпляр будет удалена и произойдет выход из ее области видимости, ARC незамедлительно вызовет деинициализатор и уничтожит объект



// Ссылки в замыканиях

// пример как value type может быть передан по ссылке
var a = 2
let f = { print(a) }
f()
a = 3
f()

// замвкания всегда захватывают значения по ссылке, а не копированием

class Man {
    var name = "Human"
    
    deinit {
        print("Object delete")
    }
}
var closure: (() -> Void)?

if true {
    let man = Man()
    closure = {
        print(man.name)
    }
    closure!()
}
print("Program end")

if true {
    let man = Man()
    closure = { [unowned man] in
        print(man.name)
    }
    closure!()
}
print("Program end")

// тип ссылки для нескольких входных аргументов
/*
 let closureWithSomeArgs = { [unowned human, weak house] in
    // body closure
 }
 
 
 */

//: [Next](@next)
