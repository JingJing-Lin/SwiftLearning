//: [Previous](@previous)

import Foundation
// --1
var str = "Hello, playground"

let names = ["china","inach","achin","hinac","nachi"]

func backward(s1:String, s2:String) -> Bool {
    return s1 < s2;
}
var reversedNames = names.sorted(by: backward)

// 闭包表达式语法有如下的一般形式：
//  { (parameters) -> (return type) in
//    statements
//  }
var reversedNames2 = names.sorted(by: {(s1:String, s2:String) -> Bool in
    return s1 < s2
})

var reversedNames3 = names.sorted(by: { s1, s2 in return s1 > s2})

var reversedNames4 = names.sorted(by: {$0 > $1})

// 运算符函数
var reversedNames5 = names.sorted(by: <)

// --2

let digitNames = [
   0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
   5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]
let numbers = [18,26,520]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    
    return output
}

// --3
// 疑惑，不懂
func makeInCrementer(amount: Int) -> () -> Int {
    var total = 0
    func incrementer()->Int{
        total += amount
        return total
    }
    return incrementer
}

let incrementerten = makeInCrementer(amount: 10)
incrementerten()
incrementerten()
incrementerten()

let incrementBySeven = makeInCrementer(amount: 7)
incrementBySeven()

incrementerten()

// 函数和闭包都是引用类型。

// --4
// 逃逸闭包

// 很多函数接收闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到任务完成——闭包需要逃逸，以便于稍后调用
var completionHandlers:[()->Void] = []
func someFuncEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}

// 让闭包 @escaping 意味着你必须在闭包中显式地引用 self ，比如说，下面的代码中，传给 someFunctionWithEscapingClosure(_:) 的闭包是一个逃逸闭包，也就是说它需要显式地引用 self 。相反，传给 someFunctionWithNonescapingClosure(_:) 的闭包是非逃逸闭包，也就是说它可以隐式地引用 self 。

func someFuncNoneEscapingClosure(closure: () -> Void){
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFuncEscapingClosure {
            self.x = 100
        }
        someFuncNoneEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//: [Next](@next)
