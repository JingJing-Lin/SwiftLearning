//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct Resolution {
    var width = 0
    var height = 0
    
}

// 所有的结构体都有一个自动生成的成员初始化器
let vga = Resolution(width: 100, height: 100)


class User {
    var age = 0
    var name: String = ""

}

// 值类型是一种当它被指定到常量或者变量，或者被传递给函数时会被拷贝的类型。
// Swift 中所有的基本类型 整数，浮点数，布尔量，字符串，数组和字典 都是值类型，并且都以结构体的形式在后台实现。
// Swift 中所有的结构体和枚举都是值类型， 这意味着你所创建的任何结构体和枚举实例，作为属性所包含的任意值类型，在代码传递中总是被拷贝的


let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
// 检查 cinema的 width属性发现已被改成 2048 ：
print("cinema is now \(cinema.width) pixels wide")
// 原始 hd实例中的 width属性依旧是 1920
print("hd is still \(hd.width) pixels wide")

/**
 这个栗子声明了一个叫 hd 的常量,并且赋予它一个以全高清视频( 1920像素宽乘以 1080像素高)宽和高初始化的 Resolution实例。

 之后声明了一个叫 cinema的变量并且以当前 hd 的值进行初始化。因为 Resolution是一个结构体，现有实例的拷贝会被制作出来，然后这份新的拷贝就赋值给了 cinema。尽管 hd和 cinema有相同的像素宽和像素高，但是在后台中他们是两个完全不同的实例。
 */


// -------------类是引用类型
// 不同于值类型，在引用类型被赋值到一个常量， 变量或者本身被传递到一个函数的时候它是不会被拷贝的。相对于拷贝，这里使用的是同一个对现存实例的引用。

let people = User()
people.age = 25
people.name = "345"

let xiaoming = people
xiaoming.age = 30

print("The people is now \(people.age)")

// 因为类是引用类型， people 和 xiaoming其实都是引用了相同的 User实例。实际上，它们只是相同实例的两个不同命名罢了。


// 特征运算符
// 相同于 ( ===)
// 不相同于( !==)
// “相同于”意味着两个类类型常量或者变量引用自相同的实例；
if people === xiaoming {
    print("people and xiaoming refer to the same User instance.")
}

//: [Next](@next)
