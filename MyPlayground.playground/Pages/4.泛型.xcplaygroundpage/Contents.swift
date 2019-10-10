//: [Previous](@previous)

import Foundation

// 把名字写在尖括号里来创建一个泛型方法或者类型。
func makeArray<Item>(repeating item: Item, numOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "Hello", numOfTimes: 5);


enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)



//: [Next](@next)
