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
 Forklar rollen til en delegate og hva den brukes til. Gi eksempler på klasser i Cocoa
 Touch (iOS) som implementerer delegate-patternet.
 */

// b)

/*
Hva er oppgaven til en view controller? Forklar og illustrer
 */

// c) 

/*
 Nedenfor er et bilde fra Photos-appen i iOS. Forklar hvordan du ville implementert å
 vise et eksempelbilde på skjermen etter brukeren trykker på “Get Started”-knappen.
 */

// d)

/*
 Forklar hva rollen til en UINavigationController er, og hvordan man bruker den
 sammen med en eller flere UIViewController hvis du skulle laget en app som skulle vise en liste
 over kontaktene dine, og detaljvisningen for en enkelt av de kontaktene. Tegn og forklar.
 */