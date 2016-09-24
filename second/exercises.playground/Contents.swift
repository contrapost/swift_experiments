/*:
# Øvingsoppgaver forelesning 2


## Oppgave 1a: 
Lag en funksjon, minimum, som tar to verdier, og returnerer den minste

minimum(a: 54, b: 392)   // 54

## Oppgave 1b: Lag samme type funksjon for maximum

maximum(a:54, b: 392)    // 392
*/

func minimum(a : Int, b : Int) -> Int {
    return a < b ? a : b
}

print(minimum(a: 56, b: 32))


func maximum(a : Int, b : Int) -> Int {
    return a > b ? a : b
}

print(maximum(a: 345, b: 34345))


/*:
## Oppgave 2:
Lag en funksjon, sumOfAllValues, som summerer all verdiene i et array

sumOfAllValues(inArray: [34,10,10,10,100]) //  164

*/

func sumOfAllValues(array: [Int]) -> Int{
    return array.reduce(0, +)
}
print(sumOfAllValues(array: [34,10,10,10,100]))


/*:
## Oppgave 3a: 
Lag en funksjon, numbersBiggerThan, som tar inn et tall, og et array og returnerer alle verdiene i arrayet som var større enn tallet som ble gitt

numbersBiggerThan(54, [34,39,100,493,1,5])    // [ 100, 493 ]

## Oppgave 3b: Utvid funksjonen til å returnere nil hvis ingen verdier var større enn tallet du ga

numbersBiggerThan(999, [34,39,100,493,1,5])    // nil ,   MERK: nil er ikke det samme som et tomt array

*/

func numbersBiggerThan(number: Int, array : [Int]) -> [Int]? {
    let new_array = array.filter { $0 > number }
    if new_array.count == 0 {
        return nil
    } else {
        return new_array
    }
}

print(numbersBiggerThan(number: 54, array: [34,39,100,493,1,5]))

print(numbersBiggerThan(number: 999, array: [34,39,100,493,1,5]))

/*:
## Oppgave 4a:
Lag denne funksjonen. Output skal være "WWWWW"

repeatCharacter(Character("W"), 5)

*/

func repeatCharacter(char: Character, number : Int = 1) {
    var result = ""
    for _ in 0 ..< number {
        result += String(char)
    }
    print(result)
}

repeatCharacter(char: "W", number: 5)
repeatCharacter(char: "W")

/*:
## Oppgave 4b
Utvid funksjonen til å støtte default parametere. Dvs. at når times ikke oppgis, så skal den som standard settes til 1. Output her blir altså "W"

repeatCharacter(Character("W"))
*/



/*:

## Oppgave 5a :

Lag en funksjon og en enum gjør at du kan definere denne metoden :

setCase(text: "Interstellar", case: .Uppercase) // INTERSTELLAR
setCase(text: "Interstellar", case: .Lowercase) // interstellar
*/

enum Cases {
    case Uppercase
    case Lowercase
}

func setCase(text: String, caseOftext: Cases) {
    
    switch caseOftext {
    case .Lowercase:
        print(text.lowercased())
    default:
        print(text.uppercased())
    }
}

setCase(text: "Interstellar", caseOftext: .Uppercase)
setCase(text: "Interstellar", caseOftext: .Lowercase)

/*:
## Opppgave 5b
utvid funksjonen til å akseptere nil som case argument, hvor den da velger uppercase

setCase(text: "Interstellar", case: nil) // INTERSTELLAR

*/

func setCaseWithNil(text: String, caseOftext: Cases?) {
    
    if let actualCase = caseOftext {
        switch actualCase {
        case .Lowercase:
            print(text.lowercased())
        default:
            print(text.uppercased())
        }
    } else {
        print(text.uppercased())
    }
}

setCaseWithNil(text: "Interstellar", caseOftext: nil)
setCaseWithNil(text: "Interstellar", caseOftext: .Lowercase)


/*:
## Oppgave 5c 
utvid funksjonen til å ha default nil som case arugment, slik at man kan, men ikke trenger å gi case

setCase(text: "Interstellar") // INTERSTELLAR
*/

func setCaseWithDefaultNil(text: String, caseOftext : Cases? = nil) {
    
    if let actualCase = caseOftext {
        switch actualCase {
        case .Lowercase:
            print(text.lowercased())
        default:
            print(text.uppercased())
        }
    } else {
        print(text.uppercased())
    }
}

setCaseWithDefaultNil(text: "Interstellar")


/*:
## Oppgave 5d
utvid funksjonen til å kunne ta nil som text argument også, men da retunerer nil

setCase(text: nil) // nil

*/

func setCaseWithDefaultNils(text: String?, caseOftext : Cases? = nil) -> String? {
    
    if let actualText = text {
        if let actualCase = caseOftext {
            switch actualCase {
            case .Lowercase:
                return actualText.lowercased()
            default:
                return actualText.uppercased()
            }
        } else {
            return actualText.uppercased()
        }
    } else {
        return nil;
    }
}

print(setCaseWithDefaultNils(text: nil))

/*:
## Oppgave 6a
Lag en funksjon som kan ta inn et variabelt antall parametere, og sum regner ut produktet av disse:

calculate(2, 5, 5) // --> 50
calculate(10, 10) // --> 100
*/

func calculate(numbers: Int ...) -> Int {
    return numbers.reduce(1, *)
}

print(calculate(numbers: 2, 5, 5))
print(calculate(numbers: 10, 10))

/*:
## Oppgave 6b
Utvid funksjonen slik at den støtter utregning av både produkt og sum (med enum som første parameter):

calculate(.Product, 2, 5, 5) // -> 50
calculate(.Product, 10, 10) // -> 100
calculate(.Sum, 2, 5, 5) // -> 12
calculate(.Sum, 10, 10) // -> 20
*/

enum Operation {
    case Product
    case Sum
}

func calculateWithOperation(_ operation : Operation, _ numbers: Int ...) -> Int {
    
    switch operation {
    case .Product:
        return numbers.reduce(1, *)
    default:
        return numbers.reduce(0, +)
    }
}

calculateWithOperation(.Product, 2, 5, 5) // -> 50
calculateWithOperation(.Product, 10, 10) // -> 100
calculateWithOperation(.Sum, 2, 5, 5) // -> 12
calculateWithOperation(.Sum, 10, 10) // -> 20


/*:
## Oppgave 6c
Endre funksjonen slik at den returnerer flere verdier, og alltid regner ut både produkt og sum:

let result = calculate(2, 5, 5)
print("Produkt: \(result.product), Sum: \(result.sum)")
*/

func calculateAndReturnTuple(_ numbers: Int ...) -> (sum : Int, product : Int) {
    return (numbers.reduce(0, +) , numbers.reduce(1, *))
}

let result = calculateAndReturnTuple(2, 5, 5, 16, 34)
print("Produkt: \(result.product), Sum: \(result.sum)")



/*:
## Oppgave 7
Lag en funksjon getCalculator, som tar imot en operator. Dersom operatoren er gyldig (er + eller *) skal riktig regnefunksjon returneres, som igjen kan kalles for å utføre selve regneoperasjonen. Hvis operatoren ikke er støttet (altså ikke er + eller *) skal nil returneres.

// Skal kunne regne ut produkt ved å bytte ut + med *:
if let calcFn = getCalculator("+") {
print(calcFn([3, 6, 9]))
}
*/

func getCalculator(_ operation : String) -> (([Int]) -> Int)? {
    if operation == "+" {
        return { numbers in
            return numbers.reduce(0, +)
        }
    } else if operation == "*" {
        return { numbers in
            return numbers.reduce(1, *)
        }
    } else {
        return nil
    }
}

if let calcFn = getCalculator("+") {
    print(calcFn([3, 6, 9]))
}

if let calcFn = getCalculator("*") {
    print(calcFn([3, 6, 9]))
}

/*:
# Oppgave 8
Lag en request-metode som tar inn en string som første
parameter, og en closure som 2. parameter:

request("http://www.vg.no", { beskrivelse in
if beskrivelse {
print(beskrivelse)
} else {
print("Fant ikke noen beskrivelse")
}
})

Når URLen er `http://www.vg.no` som i eksemplet, skal
beskrivelsen være "Verdens gang". Dersom URLen er `http://www.aftenposten.no` skal beskrivelsen være "Aftenposten". I andre tilfeller er beskrivelsen `nil` og `Fant ikke noen beskrivelse` skal skrives ut
*/

func request(address : String?, text : (String?) -> Void) {
    if address == "http://www.vg.no" {
        text("Verdens gang")
    } else if address == "http://www.aftenposten.no" {
        text("Aftenposten")
    } else {
        text(nil)
    }
}

request(address: "http://www.vg.no", text: { description in
    if let actualDescription = description {
        print(actualDescription)
    } else {
        print("Fant ikke noen beskrivelse")
    }
})

request(address: nil, text: { description in
    if let actualDescription = description {
        print(actualDescription)
    } else {
        print("Fant ikke noen beskrivelse")
    }
})

/*:

# Oppgave 9 a.

Lag en metode som tar string som 1. parameter, success-closure som 2. parameter, og error-closure som 3.parameter. Response skal være av typen [NSObject : AnyObject], og error skal være av typen NSError

startRequesting(url:"http://http.cat", success: { (response) in
     print(response)
}, failure: { (error) in
     print(error)
}

*/

func startRequesting(url : String, success : (AnyObject) -> Void, failure : (Error) -> Void ) {
    success(url as AnyObject)
}

startRequesting(url:"http://http.cat", success: { (response) in
    print(response)
    }, failure: { (error) in
    print(error)
})

/*:
# Oppgave 9 b.

Gjør om metoden til å kunne kalles med optional failure closure som er default nil.

startRequesting(url:"http://http.cat", success: { (response) in
     print(response)
}
*/

func startRequestingWithDefaulFailure(url : String, success : (AnyObject) -> Void, failure : ((Error) -> Void)? = nil ) {
    success(url as AnyObject)
}

startRequestingWithDefaulFailure(url:"http://http.cat", success: { (response) in
    print(response)
})

/*:
# Oppgave 9 c.

Legg til en enum som sier hva slags HTTP-verb som skal brukes
enumen skal ha GET, POST, PUT og DELETE

startRequesting(url:"http://http.cat", method: httpMethod.GET, success: { (response) in
     print(response)
}
*/

enum httpMethod {
    case GET
    case Post
    case PUT
    case DELETE
}

func startRequestingWithHTTPMethods(url : String, method : httpMethod, success : (AnyObject) -> Void, failure : ((Error) -> Void)? = nil ) {
    success(url as AnyObject)
}

startRequestingWithHTTPMethods(url:"http://http.cat", method: httpMethod.GET, success: { (response) in
    print(response)
})

/*:
# Oppgave 10:

Fullfør dette programmet:

// 1. Lag en struct `Coordinate` som inneholder lat/long her

/* 2. Lag en klasse `GeoCache` som har properties for:
- Coordinate
- name
- hint
- log (en array med strenger)

Lag en `signLog` metode som legger igjen en beskjed i cacheloggen
*/

let cache = /* instansier og populer GeoCache, eks:
lat: 59.91126
long: 10.76046
name: Westerdals
hint: Rom 81
*/

cache.signLog("Someone was here...")
cache.signLog("I was here!")
println(cache.description)

Slik at det ender med å skrive ut:

Westerdals
59.0 42.0
Hint: Rom 81

Logg:
Someone was here...
I was here!
*/


struct Coordinate {
    var latitude: Double = 0
    var longitude: Double = 0
}

class GeoCache {
    var coordinate : Coordinate
    var name : String
    var hint : String
    var log : [String] = []
    
    init(lat : Double, lon : Double, name : String, hint : String) {
        self.coordinate = Coordinate(latitude: lat, longitude: lon)
        self.name = name
        self.hint = hint
    }
    
    func signLog(text : String) -> Void{
        log.append(text)
    }
    
    func description() -> String {
        var logInfo = ""
        for item in log {
            logInfo += "\(item)\n"
        }
        return "\(name)\n\(coordinate.latitude) \(coordinate.longitude)\nHint \(hint)\n\nLogg:\n\(logInfo)"
    }
}

let cache = GeoCache(lat: 59.91126, lon: 10.76046, name: "Westerdals", hint: "Rom 81")

cache.signLog(text: "Someone was here...")
cache.signLog(text: "I was here!")
print(cache.description())
