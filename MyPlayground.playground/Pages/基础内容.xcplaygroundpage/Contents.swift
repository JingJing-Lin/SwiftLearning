//: [Previous](@previous)

import Foundation

// 类型别名
// 一旦为类型创建了一个别名，你就可以在任何使用原始名字的地方使用这个别名。
typealias audioSample = UInt16

var maxAm = audioSample.max


// 元组
let http200Status = (statusCode: 200, des: "ok")

print("The code is \(http200Status.statusCode)")
print("The code is \(http200Status.0)")

let (justTheCode,_) = http200Status
print("The code is \(justTheCode)")

// nil
// Swift 中的 nil 和Objective-C 中的 nil 不同，在 Objective-C 中 nil 是一个指向不存在对象的指针。在 Swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型。


//: [Next](@next)
