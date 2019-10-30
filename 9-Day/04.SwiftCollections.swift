
var someInts: [Int] = [Int]()
print("Data of \(someInts) \(someInts.count)")

someInts.append(30)
someInts.append(40)
someInts.append(50)
print("Data of \(someInts) \(someInts.count)")

someInts = []
print("Data of \(someInts) \(someInts.count)")

someInts = [10, 20, 30, 40, 50, 60, 70, 80, 90]
print("Data of \(someInts) \(someInts.count)")

var threeDouble: [Double] = Array(repeating: 0.0, count: 3)
//var threeDouble: [Int] = Array(repeating: 0.0, count: 3)
print(threeDouble)

var anotherThreeDouble: [Double] = Array(repeating: 2.5, count: 3)
print(anotherThreeDouble)

threeDouble = threeDouble + anotherThreeDouble
print(threeDouble)

//Both of These Declarations are Valid One
var shoppingList: [String] = ["Eggs", "Milk"]
//var shoppingList = ["Eggs", "Milk"]

if shoppingList.isEmpty {
	print("There is no item in shoppingList")
} else {
	print(shoppingList)
	print(shoppingList.count)
}

shoppingList.append("Flour")
shoppingList += ["Brigal", "Choco", "Bread"]
print(shoppingList)

print(shoppingList[0])
print(shoppingList[1])
print(shoppingList[2])
print(shoppingList[3])
print(shoppingList[4])
print(shoppingList[5])
//print(shoppingList[6])
//print(shoppingList[4...6])

print(shoppingList[3...5])
print(shoppingList[2...5])
print(shoppingList[2..<5])
print(shoppingList[3..<5])

shoppingList.insert("Carrot", at: 0)
print(shoppingList)

shoppingList.insert("Gobi", at: 0) 
print(shoppingList)
 
print(shoppingList)
let item = shoppingList.remove(at:0)
print(item)

print(shoppingList)
let first = shoppingList[0]
print(first)

for item in shoppingList { 
    print(item) 
} 

let lastItem = shoppingList.removeLast()
print(lastItem)


//In C/C++/Java
//Indexing Loop
//for (i = 0 ; i <= n ; i++ )

//In Java/C++: foreach()
//In Swift/Python : for-in loop

for item in shoppingList.enumerated() { 
    print(item) 
} 

var shoppingListCopy = shoppingList

for (index, _) in shoppingListCopy.enumerated() { 
    shoppingListCopy[index] = "Ding"
} 

print(shoppingListCopy)

// var index = 0;
for item in shoppingListCopy { 
    // item[index] = "Dong"
    // index = index + 1
    print(item)
} 

print(shoppingListCopy)

for index in 0...5 { 
	shoppingListCopy[index] = "DONG"
    print(shoppingListCopy[index])
} 

var letters = Set<Character>()
print("Letters count: \(letters.count)")

letters.insert("A")
letters.insert("B")
letters.insert("C")
letters.insert("A")
print(letters)

letters = []
print(letters)

if letters.isEmpty {
	print("Emptiness Found...")
}

var favoriteGenres: Set<String> = ["Rock", "Hip Hop", "Classical"]
let moreFavoriteGeneres: Set = ["Hindustani", "Duet", "Gazal"]

print(favoriteGenres)
print(favoriteGenres.count)
print(moreFavoriteGeneres)
print(moreFavoriteGeneres.count)

favoriteGenres.insert("Jazz")
favoriteGenres.insert("Indi Pop")
print(favoriteGenres)

let rock = favoriteGenres.remove("Rock")

let rockFinal = rock ?? "Aiyo Aiyoo..."
//Compiler Will Generate Following Code
//For Above Line of Idiomatic Code
if rock != nil {
	let rockFinal = rock!
	print(rockFinal)
} else  {
	let rockFinal = "Aiyo Aiyoo"
	print(rockFinal)
}



//print(rock!)

let rock1 = favoriteGenres.remove("Rock")
// print(rock1!)
print(rock1 ?? "Aiyo Aiyoo...")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

print("\nIterating Over Set")
for genre in favoriteGenres {
	print(genre)
}

print("\nIterating Over SORTED Set")
for genre in favoriteGenres.sorted() {
	print(genre)
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))

print("\nDictionary Topic....")
let alongFormDict = Dictionary<String, Int>()
let shortFormDict = [String:Int]()

print(alongFormDict.isEmpty)
print(shortFormDict.isEmpty)

var namesOfIntegers: [Int : String] = [ 1: "One", 2: "Two", 3: "Three"]
print(namesOfIntegers)
//IMPORTANT : You Must Deal With Nothingness
// print(namesOfIntegers[0])
// print(namesOfIntegers[1])
// print(namesOfIntegers[2])

namesOfIntegers[7] = "Seven"
namesOfIntegers[1] = "ONE"
print(namesOfIntegers)

namesOfIntegers = [:]
print(namesOfIntegers)
print(namesOfIntegers.isEmpty)

print("\nMore and More Dictionary...")

var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
print(airports)

print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
print(airports)

if let airportName = airports["DUB"] {
	print(airportName)
} else {
	print("Nothingness....")
}

airports["BLR"] = "Bangalore"
print(airports)

airports["BLR"] = nil
print(airports)

// print("\n...")
// print("\n...")
// print("\n...")


for airport in airports {
	print(airport)
}

for (code, airport) in airports {
	print(code, airport)
}

for key in airports.keys {
	print(key)
}

for value in airports.values {
	print(value)
}

let airportCodes = airports.keys
//type(of: airportCodes)
let airportNames = [String](airports.values)

print(airportCodes)
print(airportNames)

for code in airportCodes {
	print(code)
}

