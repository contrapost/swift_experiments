
import Foundation
/*:
# Oppgave 1
Lag en extension på String som gjør at du kan subscripte String og få ut en Character.
Den skal oppfylle dette:

"Hei"[0]     // H
"Hei"[1]     // e
"Hei"[4]     // nil

// observer hva som skjer om du bruker emojis og subscripter dem med samme metode:

"😸👻🙆🏽"[1]

"LOL😸👻🙆🏽"[5]

*/

extension String {
    subscript(inx : Int) -> Character? {
        guard inx >= 0 && inx < characters.count
            else { return nil }
        return self[self.characters.index(self.startIndex, offsetBy: inx)]
    }
}

"Hei"[0]
"Hei"[1]
"Hei"[4]

"😸👻🙆🏽"[1]

"LOL😸👻🙆🏽"[5]



/*:

## Oppgave 2
lag en klasse MadScientist som er subklasse av Scientist som er subklasse av Person som er subklasse av LivingBeing

følgende attributter skal lages:

Madscientist skal ha madnessfactor
Scientist skal ha IQ
Person skal ha name
livingBeing skal ha birthDate og birthPlace , disse skal det ikke gå ann å override

Dette skal gå kompilere:

let madScientist = MadScientist(madnessfactor: 41, IQ: 32, name: "John Doe")

let madScientist2 = MadScientist(IQ: 32)       // HINT: bruk convenience init og sett default-verdier på attributtene som ikke blir gitt

*/

class LivingBeing {
    final let birthDate : Date
    final let birthPlace : String
    
    init(birthDate : Date, birthPlace : String) {
        self.birthDate = birthDate
        self.birthPlace = birthPlace
    }
}

class Person : LivingBeing {
    let name : String
    
    init(name : String, birthDate : Date, birthPlace : String) {
        self.name = name
        super.init(birthDate: birthDate, birthPlace: birthPlace)
    }
    
    convenience init(name : String) {
        self.init(name : name, birthDate : Date(), birthPlace : "some default place")
    }
}

class Scientist : Person {
    let IQ : Int
    
    init(name : String, birthDate : Date, birthPlace : String, IQ : Int) {
        self.IQ = IQ
        super.init(name: name, birthDate: birthDate, birthPlace: birthPlace)
    }
    
    convenience init(IQ : Int) {
        self.init(name : "some default name", birthDate : Date(), birthPlace : "some default place", IQ : IQ)
    }
}

class MadScientits : Scientist {
    let madnessfactor : Int
    
    init(name : String, birthDate : Date, birthPlace : String, IQ : Int, madnessfactor : Int) {
        self.madnessfactor = madnessfactor
        super.init(name: name, birthDate: birthDate, birthPlace: birthPlace, IQ : IQ)
    }
    
    convenience init(madnessfactor : Int, IQ : Int, name : String) {
        self.init(name : name, birthDate : Date(), birthPlace : "some default place", IQ : IQ, madnessfactor : madnessfactor)
    }
    
    convenience init(IQ : Int) {
        self.init(name : "some default name", birthDate : Date(), birthPlace : "some default place", IQ : IQ, madnessfactor : 0)
    }
}

let madScientist = MadScientits(madnessfactor: 41, IQ: 32, name: "John Doe")

let madScientist2 = MadScientits(IQ: 32)

/*:

## Oppgave 3

1. Svar på hvorfor kompilatoren feiler når du limer inn klassen uten kontruktør
2. Lag en designated konstruktør og en convenience kontruktør for denne klassen
3. Lag nye instanser av klassen ved hjelp av de to kontruktørene du lagde i oppgave 2.2

class Timer {
var hour: Int
var minute: Int
var second: Int

var running: Bool = false
var startedAt: Date?
var stoppedAt: Date?
}

*/

class Timer {
    var hour: Int
    var minute: Int
    var second: Int
    
    var running: Bool = false
    var startedAt: Date?
    var stoppedAt: Date?
    
    init(hour : Int, minute : Int, second : Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    convenience init() {
        self.init(hour: 0, minute: 0, second: 0)
    }
}

let timer = Timer(hour: 12, minute: 13, second: 45)
let timer2 = Timer()

/*:
## Oppgave 4

1. Lag en base klasse Animal, der du finner måter å bruke final og required som beskrevet i slidene
2. Lag en metode for å sove, en metode for å returnere lyden dyret lager
3. Lag deretter en subclass, for eksempel Bird som arver av base klassen Animal
4. Bruk override for å skrive over base klassen funksjonaliteten
5. Lag en subclass til som arver av Animal base klassen
6. Lag en array med begge subklassene og foreach over dem,
7. Identifiser hva slags type det er og skriv det ut ved hjelp av println

*/

class Animal {
    let color : String
    
    
    final var isAlive : Bool {
        return true
    }
    
    required init(color : String) {
        self.color = color
    }
    
    func sleep() -> String {
        return "I'm sleeping"
    }
    
    func produceSound() -> String {
        return "some sounds"
    }
}

class Bird : Animal {
    
    override func sleep() -> String {
        return "never sleeps"
    }
    
    override func produceSound() -> String {
        return "fue-fue"
    }
}

class Frog : Animal {
    
    override func sleep() -> String {
        return "always sleeps"
    }
    
    override func produceSound() -> String {
        return "qua-qua"
    }
}

let animals = [Bird(color: "black"), Frog(color: "green")]

for animal in animals {
    if let actualAnimal = animal as? Bird {
        print("bird")
    } else if let actualAnimal = animal as? Frog {
        print("frog")
    }
}

/*:
## Oppgave 5

1. Lag en protocol LivingBeing som har attributtene isAlive, birthDate og deathDate
2. Lag en procotol extension som lager standard implmentasjon av isAlive
3. Lag en klasse Frog som følger protokollen LivingBeing
4. Skriv klassen slik at dette er mulig:

var frog = Frog(birthDate: Date())

frog.isAlive     // true

frog.deathDate = Date()

frog.isAlive     // false

*/

protocol LivingBeingProtocol {
    func isAlive() -> Bool
    var birthDate : Date { get set }
    var deathDate : Date? { get set }
}

extension LivingBeingProtocol {
    func isAlive() -> Bool {
        if deathDate == nil {
            return true
        } else {
            return false
        }
    }
}

class Frog2 : LivingBeingProtocol {
    internal var deathDate: Date?
    internal var birthDate: Date
    
    init(birthDate : Date) {
        self.birthDate = birthDate
    }
}

var frog = Frog2(birthDate: Date())
frog.isAlive()
frog.deathDate = Date()
frog.isAlive()


/*:
## Oppgave 6

1. Lag det som er nødvendig for at denne if statementen fungerer
2. Lag et eksempel på begge utfall av if


if let street = westerdals.students?.first?.address?.street {
println("Studenten bor i \(street).")
} else {
println("Kunne ikke hente gatenavn")
}

*/

class School {
    var students : [Student]? = []
}

class Student {
    
    var address : Address?
    
}

class Address {
    var street : String
    
    init() {
        street = "some default street"
    }
    
    func buildFullStreetName() -> String {
        return street
    }
}

var westerdals = School()


if let street = westerdals.students?.first?.address?.street {
    print("Studenten bor i \(street).")
} else {
    print("Kunne ikke hente gatenavn")
}


/*:
## Oppgave 7

1. Lag det som er nødvendig for at denne if statementen fungerer

```swift
if (westerdals.students?.first?.address = otherAddress) != nil {
println("Du satt en ny addresse")
} else {
println("Det var ikke mulig å sette en ny addresse")
}
```

*/

let student = Student()
student.address = Address()
student.address?.street
westerdals.students?.append(student)
print(westerdals.students?.first?.address?.street)

westerdals.students?.first

let otherAddress = Address()

if (westerdals.students?.first?.address = otherAddress) != nil {
    print("Du satt en ny addresse")
} else {
    print("Det var ikke mulig å sette en ny addresse")
}

/*:
## Oppgave 8

1. Bytt ut first? og bruk subscript i stedet

```swift
if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
println("Fullstendig gatenavn er \(fullStreetName)")
} else {
println("Kunne ikke hente fullstendig gatenavn")
}
```

*/

extension School {
    subscript(ind : Int) -> Student? {
        guard ind >= 0 && ind < (students?.count)!
            else { return nil }
        return students?[ind]
    }
}

if let fullStreetName = westerdals.students?[0].address?.buildFullStreetName() {
    print("Fullstendig gatenavn er \(fullStreetName)")
} else {
    print("Kunne ikke hente fullstendig gatenavn")
}

/*:

## Oppgave 9

1. Lag extention på String, slik at følgende kode vil fungere

```swift
"AB".length // 2
"AB".reverses() // Skal printe ut BA
"Abba".contains("AbA") // Skal printe ut false
"Abba".contains("Abb") // SKal printe ut true
```
*/

extension String {
    var length : Int {
        return self.characters.count
    }
    
    func reverse() -> String {
        return String(self.characters.reversed())
    }
    
    func contains(substring : String) -> Bool {
        self.contains(substring)
        return false
    }
}

"AB".length
"AB".reverse()
"Abba".contains("AbA")
"Abba".contains("Abb")


/*:

## Oppgave 10

1. Lag en extention på Array med en metode thirdElementInArray

```swift
let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]

anArray.thirdElementInArray()    // 24
anotherArray.thirdElementInArray()    // !
thirdArray.thirdElementInArray()    // nil

```
*/

extension Array {
    func thirdElementInArray() -> AnyObject? {
        guard self.count >= 3 else {
            return nil
        }
        return self[2] as AnyObject
    }
}

let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]

anArray.thirdElementInArray()    // 24
anotherArray.thirdElementInArray()    // !
thirdArray.thirdElementInArray()    // nil

/*:

# Oppgave 12

du har fått følgende state satt (enumen må du definere selv):

let isOnline = false
let hasTakenBackup = true
let readyState = .Ready
let name : String? = "User login screen"

func createUser() {

}

12a : Fyll ut metoden createUser med control flow uten å bruke guard - sjekk om alle bool er true, state er ready, og name har en verdi

12b : lag en ny implementasjon av metoden der du bruker så mange guard statements som mulig


*/

enum state {
    case Ready
    case Notready
}

let isOnline = true
let hasTakenBackup = true
let readyState = state.Ready
let name : String? = "User login screen"


func createUser(isOnline : Bool, hasTakenBackup : Bool, readyState : state, name : String?) -> String? {
    if isOnline {
        if hasTakenBackup {
            switch readyState {
            case .Ready:
                return name
            default:
                return "User isn't ready"
            }
        } else {
            return "Has no backup"
        }
    } else {
        return "Not online"
    }
}

func createUser2(isOnline : Bool, hasTakenBackup : Bool, readyState : state, name : String?) -> String? {
    guard isOnline else { return "Not online" }
    guard hasTakenBackup else {return "Has no backup" }
    switch readyState {
    case .Ready:
        return name
    default:
        return "User isn't ready"
    }
}

createUser(isOnline: isOnline, hasTakenBackup: false, readyState: state.Ready, name: nil)
createUser2(isOnline: isOnline, hasTakenBackup: true, readyState: state.Notready, name: nil)

/*:

# Oppgave 13

Få klassen Car til å implementere hashable

implementer funksjonalitet slik at hvis man har to car objekter og plusser de sammen så får man et dictionary hvor key er modelName

car1 + car2    // ["Tesla" : car1 ... ]

2b:
car1 + nil     // ["Tesla" : car1]


*/


class Car : Hashable {
    let modelName : String
    
    public var hashValue: Int {
        return modelName.hash
    }
    
    init(modelName : String) {
        self.modelName = modelName
    }
}

func ==(lhs : Car, rhs : Car) -> Bool {
    if lhs.hashValue == rhs.hashValue {
            return true
        }
    return false
}

extension Car {
    static func +(car1: Car, car2: Car) -> [String : Car] {
        return [car1.modelName : car1, car2.modelName : car2]
    }
}

let car1 = Car(modelName: "B")
let car2 = Car(modelName: "A")

car1 + car2

/*:

#Oppgave 14

Lag en [Any] med 5 forskjellige objekter, løp gjennom arrayet og bruk switch for å printe de forskjellige objektene hvor du skriver ut klassens navn og hvor mange av dem du har funnet til nå.

*/

let anyArray : [Any] = ["28", 28, 25.7, Date()]

for each in anyArray {
    switch each {
    case is String:
        print("String \(each)")
    case is Int:
        print("Int: \(each)")
    case is Double:
        print("Double: \(each)")
    case is Date:
        print("Date: \(each)")
    default:
        break
    }
}

/*:

#Oppgave 15

Lag en generisk metode printAllStrings som er generic på CollectionType, som går gjennom og printer alle stringer den finner til console. Den skal ikke printe ut andre objekter eller typer enn strenger

let intArray = [ 234, 34 ,33]
let stringArray = [ "hello", "world" ]
let anyObjectArray : [AnyObject] = ["Omg", 234, 342.3]

printAllStrings(intArray)
printAllStrings(stringArray)         // printer: Hello   world
printAllStrings(anyObjectArray)      // printer: Omg


*/

func printAllStrings<T: Collection>(elements: T) {
    for element in elements {
        if element is String {
            print(element)
        }
    }
}

let intArray = [ 234, 34 ,33]
let stringArray = [ "hello", "world" ]
let anyObjectArray : [Any] = ["Omg", 234, 342.3]

printAllStrings(elements: intArray)
printAllStrings(elements: stringArray)         // printer: Hello   world
printAllStrings(elements: anyObjectArray)
