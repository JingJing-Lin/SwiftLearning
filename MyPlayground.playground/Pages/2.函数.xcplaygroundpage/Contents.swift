//: [Previous](@previous)

import Foundation

func greet(person: String, day: String) -> String{
    return "hello \(person) \(day)"
}

greet(person: "Bob", day: "Tuesday")


func greet2(_ person: String, week day: String) -> String{
    return "hello \(person) \(day)"
}

greet2("Kangkang", week: "Sunday")

func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(numbers: 45, 12, 34)

func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrement()
increment(8)

var numbers = [20, 19, 7, 12]
let mapNum = numbers.map { (number) -> Int in
    let result = 3 * number
    return result
}

print(mapNum)

let sortNums = numbers.sorted{ $0 < $1}
print(sortNums)


//: [Next](@next)
