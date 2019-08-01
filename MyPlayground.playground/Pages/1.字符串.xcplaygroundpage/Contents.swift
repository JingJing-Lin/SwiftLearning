import UIKit

let str: String? = nil

// if let 判断是否为空
if let name = str {
    print("sss \(name)")
}else{
    print("ddd")
}

let fullName = "Hi \(str ?? "jack")"

//-------------------------- 控制流

let vege = "red paopao"

switch vege {
case "green paopao":
    print("111")
case "white", "blue":
    print("ddd")
case let x where x.hasSuffix("paopao"):
    print("kkkk")
default:
    print("llll")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 30, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, values) in interestingNumbers {
    for value in values {
        if value > largest {
            largest = value
        }
    }
}
print(largest)

var m = 2
repeat {
    m = m * 2
}while m < 100
 print(m)

var n = 2
while n < 100 {
    n = n * 2
}
print(n)
