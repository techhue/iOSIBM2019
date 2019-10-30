//var emptyString = ""


var someString = "Ding Dong" 
someString = nil

var emptyString = String()
 
if emptyString.isEmpty { 
    print("Emptiness Found...") 
} else { 
    print("Ding Dong") 
} 

var variableString = "Horse"
variableString += " and carriage"
print(variableString)

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)


let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2
print(instruction)

welcome.append(exclamationMark)
print(welcome)

let multiplier = 3
//String Extrapolation
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)


let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"           // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"         // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}"    // 💖, Unicode scalar U+1F496

print(wiseWords)
print(dollarSign)
print(blackHeart)
print(sparklingHeart)

let eAcute: Character = "\u{E9}"                // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́

print(eAcute)
print(combinedEAcute)

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
let combinedEAcuteQuestion2 = "Voulez-vous un cafe\u{301}?"

print(eAcuteQuestion)
print(combinedEAcuteQuestion)
print(combinedEAcuteQuestion2)

if eAcuteQuestion == combinedEAcuteQuestion {
	print("Phonetically Both Are Equal")
}

if eAcuteQuestion == combinedEAcuteQuestion2 {
	print("Phonetically Both Are Equal")
}

if combinedEAcuteQuestion == combinedEAcuteQuestion2 {
	print("Phonetically Both Are Equal")
}


