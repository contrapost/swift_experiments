//: Playground - noun: a place where people can play

import Cocoa

// Oppgave 1
// a)
let numberOfMovies = 250
let moviesIHaveSeen = 143
let title = "IMDB Top Movies"

print("Jeg har sett \(moviesIHaveSeen) av \(numberOfMovies) filemr på lista over \(title)")

// b)

let movie = ("The Matrix", "Since Fiction", hasSeen : true)

movie.0
movie.1
movie.hasSeen

// c)

var movieDictionary = [ "The Matrix": true, "Interstellar" : true, "Avatar" : false ]
for movie in movieDictionary.keys {
    if (movieDictionary[movie] == false) {
        movieDictionary.removeValue(forKey: movie)
    }
}

// d)

func withOptional(firstname: String, middlename: String?, age: Int, hasVisited: Bool?) {
    var text = firstname

    if let actualMiddlename = middlename {
        text = text + " " + actualMiddlename
    }
    
    text = text + ", age: \(age)"
    
    if let actualHasVisited = hasVisited {
        text = text + ", has visited: \(actualHasVisited)"
    }
    
    print(text)
}

withOptional(firstname: "Zoe", middlename: nil, age: 29, hasVisited: nil)
withOptional(firstname: "Denis", middlename: "Teo", age: 32, hasVisited: true)

// e)
func withOptionalAndGuard(firstname: String, middlename: String?, age: Int, hasVisited: Bool?) {

    guard let _ = middlename, let _ = hasVisited else {
        print("There is no middle name or hasVisited value")
        print(firstname + ", age: \(age)")
        return
    }
    
    print(firstname + " " + middlename! + ", age: \(age), has visited: \(hasVisited!)")
}

withOptionalAndGuard(firstname: "John", middlename: "Babao", age: 45, hasVisited: nil)

// f)

extension String {
    func firstLetter() -> Character? {
        guard self.characters.count > 0 else {
            print("The string is empty")
            return nil
        }
        return self.characters.first
    }
}

"Hello".firstLetter()
"Eksamen oppgave 1".firstLetter()
"".firstLetter()

// g)

func checkTypes(array: [Any]) -> Void {
    for item in array {
        if item is String {
            print("String: \(item)")
        } else if item is Int {
            print("Integer: \(item)")
        } else if item is Array<Any> {
            print("Array: \(item)")
        } else {
            print("Some other type")
        }
    }
}

checkTypes(array: ["Elon Musk", 1300, [42, 32, 8423, 3], 98, "SpaceX coordinates: 2.42, 242.23", false])

// h)

class Storage<T> {
    var object: T
    init(object: T) {
        self.object = object
    }
}

// Storage is a generic class that is parameterized over types. T is a type that can be either primitive or class. Generic classes are more flexible because they do not depend on concrete types and
// can be used with different types.

let intStorage = Storage<Int>(object: 10)
let stringStorage = Storage<String>(object: "String")

class Car {
    var color : String
    
    init(color: String) {
        self.color = color
    }
}

let carStorage = Storage<Car>(object: Car(color: "Black"))

// i)

protocol Vehicle {
    var fuelType: FuelType { get set }
    var fuelLevel: Double { get set }
    
    init(fuelType: FuelType, fuelLevel: Double)
}
// 1. lag enum
enum FuelType {
    case petrol
    case deisel
    case kerosene
    case gas
    case hydrazine
    case water
}

class Rocket : Vehicle {
    internal var fuelLevel: Double
    internal var fuelType: FuelType

    required init(fuelType: FuelType, fuelLevel: Double) {
        self.fuelType = fuelType
        self.fuelLevel = fuelLevel
    }
    
}
class Falcon9 : Rocket {
    var launchDate: Date?
    var failureReason: String?
    
    convenience init() {
        self.init(fuelType: .hydrazine, fuelLevel: 0.0)
    }
    
    func refuel(addedFuel: Double) {
        fuelLevel += addedFuel
    }
    
    func launch(date: Date?) {
        if fuelLevel >= 600 {
            failureReason = "too much fuel in fuel tank"
        }
        if fuelType == .water {
            failureReason = "Falcon 9 is too big to be powered by water"
        }
        
        if failureReason != nil {
            let message = "The rocket was not launched because of \(failureReason!)"
            guard date != nil else {
                print(message)
                return
            }
            print("\(message), attemp to lanch was made: \(date!)")
        } else {
            if date == nil {
                launchDate = Date()
            } else {
                launchDate = date!
            }
            print("The rocket was launched \(launchDate!)")
        }
        
    }
    
    func launch() {
        launch(date: nil)
    }
    
    // 4. lag attributt
    // 5. lag konstruktør
    // 6. lag refuel-metoden
    // 7. lag launch-metoden
}
let firstFalcon = Falcon9()
firstFalcon.refuel(addedFuel: 100)
firstFalcon.refuel(addedFuel: 50)
firstFalcon.refuel(addedFuel: 10) // fuelLevel skal være 160
print(firstFalcon.launchDate as Any) // skal printe nil
firstFalcon.launch()


let secondFalcon = Falcon9()
secondFalcon.refuel(addedFuel: 600)
secondFalcon.launch(date: Date())


let waterRocket = Falcon9(fuelType: .water, fuelLevel: 400)
waterRocket.launch()


// Oppgave 2

// a)

/*
 Delegation is a programming pattern in which one object in a program (delegate) acts on behalf of another (delegating object). The delegating object sends messages to the delegate with information about action that the delegating object performed/ is about to perform. The delegate reacts on the message by changing own status or changing another objects.
 We can use delegating pattern in Cocoa Touch by implementing protocols, for example UITextFieldDelegate, i.e. by customizing methods that delegate should have to implement a protocol. 
 If we use UITableView we have to implement a method that supplies UITableView with information about number of rows (numberOfRowsInSection), so we create a delegate of UITableView.
 */

// b)

/*
1. View controller manages the hierarchy of views. It has a root view that view controller has a reference to. The root view can have a hierarchy of views that have a strong reference to their subviews.
 =====================
 =                   =          ==============
 =                   =--------> = Root view  =
 =  View Controller  =          ==============
 =                   =                 |
 =                   =           ______|_____
 =====================           |          |
                                 V          V
                        ==============  ==============
                        =    View    =  =    View    =
                        ==============  ==============
 
 2. View controller is a connecting point between views it manages and application data, i.e view controller translate the data to visual representation.
 3. View controller handles user interactions by for example implementing protocols and being delegate of different delegating objects. 
 4. View controller manages resources. For example by implementing didReceiveMemoryWarning method view controller can inform the app that it should free up any resources that are no longer needed. 
 5. View controller adapts its views to the environment (for ex. different sizes of devices).
 */

// c) 

/*
 */

// d)

/*
 UINavigationController is a special implementaton of a view controller that manages navigation of a hierarchical content. It contains an array of view controllers that represents some hierarchical data structure, the application deals with. UINavigationController controlls navigation between view controlles and manages UINavigationBar and UIToolbar.
 */
