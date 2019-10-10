//: [Previous](@previous)

import Foundation

protocol ExampleProtocal {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocal {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 56789
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDes = a.simpleDescription

// 注意使用 mutating关键字来声明在 SimpleStruct中使方法可以修改结构体。在 SimpleClass中则不需要这样声明，因为类里的方法总是可以修改其自身属性的。
struct SimpleStruct: ExampleProtocal {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStruct()
b.adjust()
let bDescription = b.simpleDescription

extension Int: ExampleProtocal {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(8.simpleDescription)
//: [Next](@next)
