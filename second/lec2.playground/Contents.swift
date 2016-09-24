//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func greet(name: String, prefix: String = "") {
    print("Hello, \(prefix) \(name)!")
}

greet(name: "Anderson")
greet(name: "Anderson", prefix: "Mr")

func greetMany(names: String...){
    for name in names {
        print("Hello, \(name)")
    }
}

greetMany(names: "Agent Smith", "Mr Anderson")


// inout
func swapInts(first: inout Int, second: inout Int) {
    let temp = first
    first = second
    second = temp
}

var a = 5
var b = 10
swapInts(first: &a, second: &b)
print("a = \(a), b = \(b)")

// Closures
let greetingClosure = { (greeting : String, name : String) -> () in
    print("\(greeting), \(name)!")
}

greetingClosure("Hello", "Ivan")

let arr = [43, 10, 28, 90]

arr.sorted(by: { x, y in y > x })

arr.sorted(by: { $0 < $1 })

//
let date = Date()

date.description

let numbers = [34, 2, 1, 45, 33, 645]

let sortedNumbers = numbers.sorted { (x, y) -> Bool in
    return x < y
}

let sortedNumbers2 = numbers.sorted { $0 < $1 }

print(sortedNumbers2)

enum AccessLevel {
    case all
    case firstFloor
}

let accessLevel = AccessLevel.all
let anotherAccessLevel = AccessLevel.firstFloor

func open(accessLevel: AccessLevel){
     print(accessLevel)
}

open(accessLevel: .all)
