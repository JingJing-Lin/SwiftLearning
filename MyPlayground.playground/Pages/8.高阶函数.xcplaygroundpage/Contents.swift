//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


// map 简单说就是数组中每个元素通过某个方法进行转换，最后返回一个新的数组。
var dataArr = str.split(separator: ",").map(String.init)

dataArr = str.split(separator: ",").map({ abc in
    return abc + "--"
})

let price = [10, 20, 40]
let strs = price.map({ "$\($0)" })
print(strs)

        
// flatMap 方法同 map 方法比较类似，只不过它返回后的数组中不存在 nil（自动把 nil 给剔除掉）同时也会把Optional解包、
// 注意：4.1之后如果闭包中返回的值是可选的话，就要使用compactMap代替flatMap了，不然的话就会警告。
let arr1 = ["hello", "girl", "beautiful", ""]
let arr2 = arr1.map { (a) -> Int? in
    let length = a.count
    guard length > 0 else {
        return nil
    }
    return length
}
print(arr2)
let arr3 = arr1.compactMap({ (b) -> Int? in
    let length = b.count
    guard length > 0 else {
        return nil
    }
    return length
})
print(arr3)

// compactMap 还能把数组中存有数组的数组（二维数组、N维数组）一同打开变成一个新的数组。
let array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let arr4 = array.map{ $0 }
let arr5 = array.flatMap{ $0 }
print(arr4) // [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(arr5) // [1, 2, 3, 4, 5, 6, 7, 8, 9]


// filter 函数
// filter 方法用于过滤元素，即筛选出数组元素中满足某种条件的元素。
let prices = [12,24,36,48]
let result = prices.filter { (a) -> Bool in
    a > 26
}
let result2 = prices.filter {($0 > 25)}
print(result2)



//: [Next](@next)
