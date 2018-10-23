import UIKit

var str = "Hello, playground"

//Int 类型的最小和最大值
let minValue = Int.min
let maxValue = Int.max

//这字面量 3 没有显式的声明它的类型，但因为后边有一个浮点类型的字面量，所以这个类型就被推断为 Double
let anotherPi = 3 + 0.14159

//数值型字面量也可以增加额外的格式使代码更加易读。整数和浮点数都可以添加额外的零或者添加下划线来增加代码的可读性。下面的这些格式都不会影响字面量的值。
let paddedDouble: Float = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

let three = 3
let pointOneFourOneFiveNine = 0.14159
let threep = Double(three) + pointOneFourOneFiveNine

//用 typealias 关键字定义类型别名。一旦为类型创建了一个别名，你就可以在任何使用原始名字的地方使用这个别名。
typealias AudioSample = UInt16

//元组
let http404Error = (404,"Not Found")
http404Error.0
http404Error.1

//必须元素的数量一致
let (statusCode,statusString) = http404Error
print(statusCode)
print(statusString)
let (statusCode1,_) = http404Error

//也可以单独命名,但是必须通过访问名字来获取元素
let httpError1 = (statuscode2: 200, statusString2: "OK")
httpError1.statuscode2
httpError1.statusString2

//nil 不能用于非可选的常量或者变量,如果你定义的可选变量没有提供一个默认值，变量会被自动设置成 nil
//Swift 中的 nil 和Objective-C 中的 nil 不同，在 Objective-C 中 nil 是一个指向不存在对象的指针。在 Swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型。
var serverResponseCode: Int? = 404
serverResponseCode = nil
var serverCode: String?

//使用 ! 来获取一个不存在的可选值会导致运行错误，在使用!强制展开之前必须确保可选项中包含一个非 nil 的值。
if serverResponseCode != nil {
    print(serverResponseCode!)
}

//使用 if 语句创建的常量和变量只在if语句的函数体内有效。相反，在 guard 语句中创建的常量和变量在 guard 语句后的代码中也可用。
//guard 必须在func 中使用
if let servercode = serverResponseCode {
    print(servercode)
}

//错误处理。通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预置 try 关键字。

func handleError() throws -> ()  {

}

do {
    try handleError()
} catch {
    print(8998899)
}
