import UIKit

// 新语言的第一节  hello world
let helloWorld = "hello world!"
print(helloWorld)

//使用let 做常量 var 做变量 编译器可以判断值的类型 也可指定其类型 但是不会隐式的转换成其他类型
let myNumber = 43
var mynumber01 = 45
mynumber01 = 46
let myNumber3: Double = 90
let label = "The width is "
let width = 99
let widthString = label + String(width)
let widthString01 = "The width is \(width)"
let widthString02 = "The width is \(mynumber01 + width) km"

//""" 用于多行字符串 以下列出了两种换行方式 需要注意的是：使用"""换行方式  不能和内容在同一行  否则会报错
let lineString = """
你好
我现在
不方便
去你那
请多包涵
"""
let lineString1 = "你好\n我现在\n不方便\n去你那"

//创建数组和字典 根据规范 最好，后留出一个空格  ：后留出一个空格
//在字典中如果类型不一致 或者无法判断出类型，需要对其进行注释，例如 : [String: Any]

/*
知识点：Any、AnyHashable、AnyObject、AnyClass的区别
Any是一个空协议集合的别名，它表示没有实现任何协议，因此它可以是任何类型，包括类实例与结构体实例，以及函数类型和可选类型。
AnyHashable遵守Hashable协议的Any类型，是Any的子集合，主要用于Dictionary和Set中。（Dictionary 要求它的Key类型需要遵守 Hashable协议）
AnyObject是一个成员为空的协议，任何对象都实现了这个协议。它是Any的子集合，Any中的类实例。
AnyClass是AnyObject.Type的别名而已。
可参考：https://blog.csdn.net/feosun/article/details/78002558
*/
var newArray = ["one", "two", "three", "four"]

//根据下标 修改元素
newArray[1] = "nihao"

//添加元素
newArray.append("nibuhao")

var newDic: [AnyHashable: Any] = [
    "name": "xiaoming",
    "age": 88,
    88: 89,
]
newDic[88] = 999

//创建空数组或者字典,如果可以推断用户信息，则可设置为空数组或者空字典
var emptyArray = [String]() //标明元素类型
let emptyArray1 = [] as [String]
emptyArray = []

var emptyDic = [String: Any]()
let emptyDic1 = [:] as [String: Any]
emptyDic = [:]

let acores = [78,89,99,23,34,54,65]
var teamScore = 0
for score in acores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//在值的类型后加？ 表示类型可选
var optionString: String? = "optionstring"
print(optionString == nil)

var optionName: String? = "fengfeng"
var greeting: String = "hello!"
if let n = optionName {
    greeting = "hello \(n)"
} else {
    print("name 是空的")
}

//处理可选值的另一种方法是使用？？ 提供默认值
let chaoName1: String? = nil
let chaoName: String = "lichao"
let chao = "hello \(chaoName1 ?? chaoName)"

//switch 支持任意类型的数据的操作，不限于整数和相等的情况. 下面例子中的where关键字指定额外的要求，并且只能在使用switch的语句，所有这些vagateble是泛型的，免去Swift中的类型转换。
//关于泛型可以参考（https://www.jianshu.com/p/6624f5365745）比较重要

let vagateble = "daxiang"
switch vagateble {
case "dayali":
    print("shuiguoshi _ dayali")
case "pingguo":
    print("shuiguoshi _ pingguo")
case "juzi":
    print("shuiguoshi _ juzi")
case let x where x.hasPrefix("daxiang") :
    print("shuiguoshi _ daxiangjiao+++++++ \(x)")
default:
    print("shadoubushi")
}

//字典的迭代 iterate （不同类型的数字是不能比较大小的，比如Double 和 Int ，需要有一个转换为相同类型才可以比较，这也是swift 安全性的体现之一）
let iterateDic = [
    "one": [2,3,4,67,78.8766,432],
    "two": [2,3,4,67,78.8766,432],
    "three": [2,3,4,67,78.8766,432],
    "four": [2,3,4,67,78.8766,432],
    "five": [2,3,4,67,78.8766,432],
]

var lagest: Double = 0
for (_, values) in iterateDic {
    for value in values {
        if value > lagest {
            lagest = value
        }
    }
}
print(lagest)

//while  repeat...while
var whileNumber = 2
while whileNumber < 200 {
    whileNumber += 33
}
print(whileNumber)


var repeatNumber = 3
repeat {
 repeatNumber += 20
} while repeatNumber < 300
print(repeatNumber)


//..< 不包括上限的值  ... 包括上限的值
var total = 0
for i in 1..<3 {
    total += i
}
print(total)

//函数和闭包
func greet(person: String, day: String) -> String {
    return "hello \(person) ,today is \(day)"
}
greet(person: "liuchao", day: "2018.9.27")

//在参数名前写入自定义的参数标签（本例的at） 或者加 _ 可省略参数标签
func greet2(_ person: String, at day: String) -> String {
    return "hello \(person) ,today is \(day)"
}
greet2("liuchao", at: "2018.9.27")


// 同objectiveC相比，swift多了一种结构类型，就是元组（之后会讲）
// 函数可使用元组 传入复合参数
func jisuanscores(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let result = jisuanscores(scores: [3,45,66,77,23,35,546,243,37])
print(result.min, result.max, result.sum)

//函数还可以嵌套
func returnFifteen() -> Int {
    var a = 10

    func add() {
        a += 5
    }

    add() //内部函数的调用需要在函数声明之后

    return a
}
returnFifteen()

//牛逼的是 函数还可以返回另一个函数作为返回值
func fanHuiHanShu() -> ((Int) -> Int) {

    func addNumber(number: Int) -> Int {
        return number + 23
    }
    return addNumber
}
let addNumber = fanHuiHanShu()
addNumber(33)

//既然函数可以作为返回值  那么函数同样可以作为参数之一
func jianCeShiFouYouShiYiXia(list: [Int], condition: (Int) -> Bool) -> Bool {

    for number in list {

        if condition(number) {
            return true
        }
    }
    return false
}
let list = [2,3,4,5,6,7,23,43]
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
jianCeShiFouYouShiYiXia(list: list, condition: lessThanTen)

//闭包closures 闭包是无名的，因为他们能够从上下文中捕获变量、常量，从而应用在自身的作用区域。
let number0 = list.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

print(number0)
print(list)

//还可以这样写， 当已知闭包的类型（例如委托的回调）时，可以省略其参数的类型，返回类型或两者。 单个语句闭包隐式返回其唯一语句的值。
let number1 = list.map( { number in
    3 * number
})
print(number0)
print(list)

//您可以按编号而不是按名称来引用参数 - 这种方法在非常短的闭包中特别有用。
//作为函数的最后一个参数传递的闭包可以在括号后面立即出现。
//当闭包是函数的唯一参数时，可以完全省略括号。
let sortedNumbers = list.sorted { $0 > $1 }
print(sortedNumbers)

//闭包的声明
var biBao: () -> String = {
    return "nihao"
}
//调用
biBao()

//无返回值的闭包
var biBao2: () -> () = {
    print("wobuhao")
}
biBao2()

//带参数的闭包
var canShuBiBao: (String, Int) -> String = {
    (name: String, age: Int) -> String in

    let nameString = "我叫 \(name), 今年\(age)岁了！"
    return nameString
}
print(canShuBiBao("liuchao",89))

//带参数的闭包简化 根据参数自动推断参数类型
canShuBiBao = {
    (name,age) in

    let nameString = "我叫 \(name), 今年\(age)岁了！"
    return nameString
}
print(canShuBiBao("liuchao001",89))

//第二次闭包简化 如果函数体只包含一句return 可省略return
canShuBiBao = {
    (name,age) in
    "我叫 \(name), 今年\(age)岁了！"
}
print(canShuBiBao("liuchao00333",89))

//第三次简化 被捕获的参数列表中 可通过 $ 获取  可自行判断出参数类型  所以可以省略 (name,age) in
canShuBiBao = {
    "我叫 \($0), 今年\($1)岁了！"
}
print(canShuBiBao("liuchao0033333333",89))

//对象和类 （: NSObject 可省略 ）
class Person: NSObject {
    var name: String = "liuchao"
    let age: Int = 28

    var newName: String? {

//        set {
//        print(newValue)
//        }

        willSet {

            print(newValue ?? "")
        }

        didSet {

            print(oldValue ?? "")
        }

//        get {
//        return "new liuchao name"
//        }
    }


    init(name: String) {
        self.name = name

        super.init()
    }

    func nameAgeString() -> String {

        return "我叫 \(name), 今年\(age)岁了！"
    }

    deinit {
        print("对象销毁")
    }
}

let person = Person.init(name: "liuchao00999999")
person.name
person.age
person.newName = "newvalue liuhao------------"
person.newName
let nageAgeString = person.nameAgeString()

//枚举和结构体

//使用该rawValue属性可以访问枚举的原始值
enum LiuChao: Int {
    case abc = 1
    case two, three, four, five, six, seven
    case liuchao1, liuchao2, liuchao3

    func jianDanGuoLv() -> String {
        switch self {
        case .abc:
            return "001"
        case .two:
            return "002"
        case .three:
            return "003"
        case .liuchao1:
            return "004"
        case .liuchao2:
            return "005"
        case .six:
            return "006"
        case .four:
            return "007"
        default:
            return "------"
        }
    }
}
let chao222 = LiuChao.abc.rawValue
let chao2242 = LiuChao.liuchao1.rawValue
LiuChao.abc.jianDanGuoLv()

if let row = LiuChao.init(rawValue: 3) {
    row.jianDanGuoLv()
}

//枚举的另一种情况
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

//结构体
struct LiuChao333 {
    var name: String
    var age: Int

    func nameAgeStringResult() -> String {

        return "\(name),\(age)"
    }
}

let naage = LiuChao333.init(name: "liuchao", age: 23)
naage.nameAgeStringResult()


//Protocols and Extensions   针对结构体和枚举 实例方法中修改属性值，可以在方法定义前添加关键字mutating
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {

    var simpleDescription: String = "this is a simple description"

    func adjust() {
        simpleDescription += "yes yes yes"
    }
}
let simpaleclass = SimpleClass()
simpaleclass.adjust()
simpaleclass.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    var anotherProperty: Int = 69105
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = b
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)

// 错误处理
enum PrinterError: Error {
    case outOfPaper
    case onToner
    case onFire
}

//如果在函数中抛出错误  函数会立刻返回 调用函数会提示错误
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "funnys" {
        throw PrinterError.outOfPaper
    }
    return "嘿嘿  不是我"
}
try send(job: 3, toPrinter: "fundnys")


//在do 内放可能引发错误的代码  catch 内可以打印错误的名字
do {
    try send(job: 3, toPrinter: "funny")
} catch let printerError as  PrinterError {
    print(printerError)
}

//处理错误的另一种方式是try？将结果转为可选的，
let printerResult = try? send(job: 2, toPrinter: "funnys")
print(printerResult ?? "dede")

//先fridgeIsOpen = true，然后是函数体正常的流程，最后在 return 之前执行 fridgeIsOpen = false,defer一个很适合的使用场景就是用来做清理工作
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]


func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("milk")
print(fridgeIsOpen)

//泛型，在尖括号里写一个名字来创建一个泛型函数或者类型。适用于类，枚举和结构体

func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()

    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem(repeating: "ItemItems", numberOfTimes: 4)

//重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleValue: OptionalValue<Int> = .none
possibleValue = .some(100)


//where 一般用作条件判断，确认实现了什么才执行函数体，比如下面，确认T.Element实现了 Equatable协议，并且T.Element == U.Element
//T.Element 表示序列元素的类型 比较的是元素的类型相等 比如[1, 2, 3]的元素类型是 Int
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

