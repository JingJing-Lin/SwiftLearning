//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

enum printError: Error {
    case outOfPrint
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw printError.noToner
    }
    return "Job sent"
}

// 一种是使用 do-catch 。在 do 代码块里，你用 try 来在能抛出错误的函数前标记。在 catch 代码块，错误会自动赋予名字 error ，如果你不给定其他名字的话。
do {
    let printResponse = try send(job: 1050, toPrinter:"Never has Toner")
    print(printResponse)
} catch {
    print(error)
}
//: [Next](@next)
