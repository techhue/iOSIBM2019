
//Immutable
var maxValue = 900
maxValue = maxValue + 10

//Mutable
//var x = 0.0, y = 0.0, z = 0.0

//A. 2.333333
//B. 2
//C. NoT
let a = 7/3
print(a)

typealias AudioSample = UInt16
var macAmplitudeFound = AudioSample.min
print(macAmplitudeFound)

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}


/* In C/C++/Java - expr of type int
	expr is zero then it is treated false
	otherwise true(nonzero)

	if (expr) {
	
	}

int x = 10;
if (x) {
}

if (x = 1) {
}

if (x == 1) {
}

//Best Practice C/C++/Java
if (1 == x) {

}
*/

var x = 1

/*
expr is Bool Type and Bool Value

if else statement in Swift is Type Safe
if (expr) { // expr is Bool Type and Bool Value
	
}
*/

if ( x == 1 ) {
	print("Ding Dong")
}


//Tuple without Named
let http404Error: (Int, String) = (404, "Not Found")
//let http404Error1: (Int, Int, Int) = (404, 502)

let status = http404Error.0
let message = http404Error.1

//Unpacking
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

//Far More Elegant Way of Tuple: Named Tuples
let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
print("The status code is \(http200Status.0)")
print("The status message is \(http200Status.1)")

let possibleNumber = "123ABC"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
	print("Happy World! \(convertedNumber!)")
} else {
	print("Nothingnes...")
}


print("\n Idioms...1 ")
if let actualNumber = Int(possibleNumber) {
	print("Happy World! \(actualNumber)")
} else {
	print("Nothingnes...")
}


print("\n Idioms...2 - Generated Code")

let optionalTemp = Int(possibleNumber) 
if optionalTemp != nil {
	let actualNumber = optionalTemp!
	print("Happy World! \(actualNumber)")
} else {
	print("Nothingnes...")
}


print("\n Idioms...3 ")

if var firstNumber = Int("4"), let secondNumber = Int("42"), 
	firstNumber < secondNumber {
		firstNumber = firstNumber + 1
    print("\(firstNumber) < \(secondNumber)")
} else {
	print("Nothingnes...")
}


let aa: Int? = 4
let bb: Int? = 10
let cc: Int? = 8

if let A = aa, let B = bb, let C = cc {
    print(A, B, C)
} else {
	print("Nothingnes...")
}


if aa != nil && bb != nil && cc != nil {
	let A = aa!
	let B = bb!
	let C = cc!
    print(A, B, C)
} else {
	print("Nothingnes...")
}

let possibleString: String? = "An optional string."
let possibleString1 = "An optional string."
//let dingDong = nil

//Do It IFF You Give Guarantee That It's Not Going to nil
//In Any Scenario

let forcedString: String = possibleString!


//BAD PROGRAMMING PRACTICE
// let assumedString: String = "An implicitly unwrapped optional string"
// let assumedString: String? = "An implicitly unwrapped optional string"

let assumedString: String! = "An implicitly unwrapped optional string"
print(assumedString)

let implicitly: String = assumedString
print(implicitly)
