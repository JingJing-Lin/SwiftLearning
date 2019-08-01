//: [Previous](@previous)

import Foundation

class User {
    var age = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simple() -> String {
        return "\(name) is \(age) years old"
    }
}

var people = User(name: "xiaoming")
people.age = 20
var des = people.simple()


// 继承父类
class OldUser: User{
    var time = 0
    
    init(time: Int, name: String) {
        self.time = time
        super.init(name: name)
        age = 18
    }
    
    func test() {
        print("haha")
    }
    
    override func simple() -> String {
        return "This is \(name), her age is \(age) years old"
    }
}

let xiaohong = OldUser(time: 2, name: "xiaohong")
xiaohong.test()
xiaohong.simple()


class NewUser: User {
    var money: Double = 0.0
    
    init(money: Double, name: String) {
        self.money = money
        super.init(name: name)
        age = 28
    }
    // 你也可以拥有带有 getter 和 setter 的计算属性。
    var yearsMoney: Double{
        get{
            return 12 * money
        }
        set{
            money = newValue / 12
        }
    }
    
    override func simple() -> String {
        return "\(name)+\(age)+\(yearsMoney)"
    }
    
}

var xiaogang = NewUser(money: 80, name: "xiaogang")
print(xiaogang.yearsMoney)
xiaogang.yearsMoney = 1200
print(xiaogang.money)
xiaogang.simple()

// 如果你不需要计算属性但仍然需要在设置一个新值的前后执行代码，使用 willSet和 didSet。例如始终保持两个人年龄相同

class TriangleAndSquare {
    var triangle: OldUser {
        willSet {
            square.time = newValue.time
        }
    }
    
    var square: OldUser {
        willSet{
            triangle.time = newValue.time
        }
    }
    
    init(time: Int, name: String) {
        square = OldUser(time: time, name: name)
        triangle = OldUser(time: time, name: name)
    }
}

var kangkang = TriangleAndSquare(time: 10, name: "kangkang")
print(kangkang.square.time)
print(kangkang.triangle.time)

kangkang.square = OldUser(time: 5, name: "hello")
print(kangkang.triangle.time)

//当你操作可选项的值的时候，你可以在可选项前边使用 ?比如方法，属性和下标脚本。如果 ?前的值是 nil，那 ?后的所有内容都会被忽略并且整个表达式的值都是 nil。否则，可选项的值将被展开，然后 ?后边的代码根据展开的值执行。在这两种情况当中，表达式的值是一个可选的值。

let dagou: NewUser? = NewUser(money: 50.0, name: "dagou")
let age = dagou?.money


// ------------------- 枚举和结构体
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight
    case jack, king
    func simple () -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .king:
            return "king"
        case .five:
            return "five"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let acrRaw = ace.rawValue
Rank.seven


if let coverRank = Rank(rawValue: 3) {
    _ = coverRank.simple()
    
}


enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// 考虑在服务器上请求日出和日落时间的case，服务器要么返回请求的信息，要么返回错误信息。
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}


// 使用struct来创建结构体。结构体提供很多类似与类的行为，包括方法和初始化器。其中最重要的一点区别就是结构体总是会在传递的时候拷贝其自身，而类则会传递引用。

struct Card {
    var rank: Rank
    var suit: Suit
    func simple() -> String {
        return "The \(rank.simple()) of \(suit.simpleDescription())"
    }
}

let threeSpades = Card(rank: .three, suit: .spades)
let threeSpadesDes = threeSpades.simple()


//: [Next](@next)
