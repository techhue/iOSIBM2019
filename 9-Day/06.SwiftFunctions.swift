func helloWorld() { print("Hello World!") }
func sayHello() -> String { return "Hello Jannni!" }
//func sayHelloOnceMore() -> String { "Hello Jannni!" }

func greeting(name: String) -> String { 
	return "Hello Jannni! \(name)!"
}

func rangeValue(start: Int, end: Int) -> Int {
	return end - start
}

func playWithFunctions() {
	print("\nFunction: helloWorld")
	helloWorld()

	print("\nFunction: sayHello")
	print(sayHello())

	// print("\nFunction: sayHelloOnceMore")
	// print(sayHelloOnceMore())

	print("\nFunction: greeting")
	print(greeting(name: "Aiswarya Rai"))

	print("\nFunction: rangeValue")
	print( rangeValue(start: 10, end: 30) )
}

// let result = minMax(numbers: [10, 20, -10, -90, 100, 80])
func minMax( numbers: [Int] ) -> (min: Int, max: Int) {
	var min = numbers[0] 
	var max = numbers[0] 
	for number in numbers {
		if number > max {
			max = number 
		} else if number < min {
			min = number
		}
	}
	return (min, max)
}

func playWithMultipleReturnValues() {
	print("\nFunction: minMax")
	print(minMax(numbers: [10, 20, -10, -90, 100, 80] ))

	let result = minMax(numbers: [10, 20, -10, -90, 100, 80])
	print(result.min, result.max)
	// print(min, max)
}

//BAD API DESIGN
//Function From 3rd Party Library: 
func joinOld(s1: String, s2: String, joiner: String) -> String {
	return s1 + joiner + s2
}

//Arguments
//External Arguments - Elephant's Teeth To Show Off
//Internal Arguments - Elephant's Teeth To Eat

//join(s1: "Hello", s2: "World!", joiner: "  ")
//join(string: "Ding", toString: "Dong", withJoiner: "   " )

//GOOD API DESIGN
//USE External Arguments - To Follow Naming Conventions
//USE Default Arguments  - To Make API Flexible
//	means To USE To Hide BAD API's
func join(string s1: String, toString s2: String, 
	withJoiner joiner: String = " ") -> String  {
	//return s1 + joiner + s2
	return joinOld(s1: s1, s2: s2, joiner: joiner)
}


//sum(x: 10, y: 20)
//sum(10, 20)
//DISCARD External Arguments - To API Backward Compatible with C/C++
// func sum(_ x: Int, _ y: Int) -> Int {
// 	//Calling C/C++ Sum Function internally
// 	print("Calling C/C++ Code")
// 	return 0
// }
// //ALWAYS: Follow Named Arguments - Readability is Better
// func sum(x: Int, y: Int) -> Int {
// 	return sum(x, y)
// }

func playWithExternalArguments() {
	print("\nFunction: join")
	print(joinOld(s1: "Hello", s2: "World!", joiner: "  "))

	print("\nFunction: join")
	print(join(string: "Ding", toString: "Dong"))

	print("\nFunction: join")
	print(join(string: "Ding", toString: "Dong", withJoiner: "   " ))

	print("\nFunction: sum")
	//print(sum(x: 10, y: 20))
//	print(sum(10, 20))
}



func arithmeticMean(numbers: Double...) -> Double {
	var total: Double = 0.0
	for number in numbers {
		total = total + number
	}
	return total / Double(numbers.count)
}



func playWithVaridiacArguments() {
	var result = 0.0

	result = arithmeticMean()
	print(result)

	result = arithmeticMean(numbers: 10, 20, 30, 40)
	print(result)

	result = arithmeticMean(numbers: 10, 20, 30, 40, 50, 60, 70, 80, 90)
	print(result)
}

func minMaxBetter( numbers: [Int] ) -> (min: Int, max: Int) {
	var min = Int.max ; var max = Int.min	
	if numbers.isEmpty { return (min, max) }
	min = numbers[0] ; max = numbers[0] 
	for number in numbers {
		if number > max 	 { max = number } 
		else if number < min { min = number }
	}
	return (min, max)
}

func isMinMaxValid(result: (min: Int, max: Int)) -> Bool {
	if result.min > result.max { return false } 
	else { return true }
}

func playWithMultipleReturnValuesBetter() {
	print("\nFunction: minMaxBetter")
	var result = minMaxBetter(numbers: [10, 20, -10, -90, 100, 80] )
	if ( isMinMaxValid(result: result) ) { print(result.min, result.max) }
	result = minMaxBetter(numbers: [10, 20, -10, -90, 100, 80])
	if ( isMinMaxValid(result: result) ) { print(result.min, result.max) }
}

func minMaxBest( numbers: [Int] ) -> (min: Int, max: Int)? {
	if numbers.isEmpty { return nil }

	var min = numbers[0] 
	var max = numbers[0] 
	for number in numbers {
		if number > max {
			max = number 
		} else if number < min {
			min = number
		}
	}
	return (min, max)
}

func playWithMultipleReturnValuesBest() {
	print("\nFunction: minMaxBest")
	if let result = minMaxBest(numbers: [10, 20, -10, -90, 100, 80] ) {
		print(result.min, result.max)
	}

	if let result = minMaxBest(numbers: [10, 20, -10, -90, 100, 80]) {
		print(result.min, result.max)
	}
}

//Pass By Reference
func swap(a: inout Int, b: inout Int) {
//func swap(var a: Int, var b: Int) {
	let temp = a
	// var a = a
	// var b = b
	a = b
	b = temp
}

func playWithSwapping() {
	var aa = 10
	var bb = 20

	//Passing Reference
	swap(a: &aa, b: &bb)
	// swap(a: aa, b: bb)
	print(aa, bb)
}


func sub(a: Int, b: Int) -> Int { return a - b }
func sum(a: Int, b: Int) -> Int { return a + b }
func sub3(a: Int, b: Int, c: Int) -> Int { return a - b - c }

func playWithFunctionTypes() {
	let something: (Int, Int) -> Int = sub
	let result = something(10, 20)
	print(result)
}

func calculator(a: Int, b: Int, 
	operation: (Int, Int) -> Int ) -> Int {
	return operation(a, b)
}

func playWithCalculator() {
	let a = 20, b = 30
	var result = 0

	result = calculator(a: a, b: b, operation: sum)
	print("\nResult : \(result)")

	result = calculator(a: a, b: b, operation: sub)
	print("\nResult : \(result)")
}


// //How To Do!
// func stepForward(input: Int) -> Int  { return input + 1 }
// func stepBackward(input: Int) -> Int { return input - 1 }
// func stepForward2(input: Int) -> Int  { return input + 2 }
// func stepBackward2(input: Int) -> Int { return input - 2 }
// func stepForward3(input: Int) -> Int  { return input + 3 }
// func stepBackward3(input: Int) -> Int { return input - 3 }

// //What To Do!
// func chooseStep(selectMove: Int) -> (Int) -> Int {
// 	return switch (selectMove) {
// 		case 1: stepForward
// 		case 2: stepBackward
// 		case 3: stepForward2
// 		case 4: stepBackward2
// 		case 5: stepForward3
// 		case 6: stepBackward3
// 	}	
// }

// //Do It Buddy!
// //Algoritm: Invariant
// func marchTowardsNothingness(value: Int, move: Int) {
// 	var currentValue = value
// 	let moveNearerToZero = chooseStep(selectMove: move)

// 	while currentValue != 0 {
// 		print(currentValue)
// 		currentValue = moveNearerToZero(currentValue)
// 	}
// 	print(currentValue)
// }


// func marchTowardsZero(value: Int, backwards: Bool) {
// 	var currentValue = value

// 	while currentValue != 0 {
// 		print(currentValue)

// 		if backwards { currentValue = currentValue - 1 }
// 		else { currentValue = currentValue + 1 }
			
// 	}
// 	print(currentValue)
// }

// //Varying...
// func marchTowardsZero(value: Int) {
// 	var currentValue = value

// 	while currentValue != 0 {
// 		print(currentValue)

// 		if currentValue > 0 { currentValue = currentValue - 1 }
// 		else if currentValue < 0 { currentValue = currentValue + 1 }
			
// 	}
// 	print(currentValue)
// }


// func playWithMarching() {
// 	// marchTowardsZero(value: 3, backwards: true)
// 	// marchTowardsZero(value: -3, backwards: false)

// 	marchTowardsZero(value: +3)
// 	marchTowardsZero(value: -3)
// }


// func playWithChoices() {
// 	let start = 10

// 	var step = chooseStep(backwards: true)
// 	print( step(start) )

// 	step = chooseStep(backwards: false)
// 	print( step(start) )
// }

// func stepForward(input: Int) -> Int { return input + 1 }
// func stepBackward(input: Int) -> Int { return input - 1 }

//Encapsulation
func chooseStepBetter(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}

func playWithChoicesBetter() {
	let start = 10

	var step = chooseStepBetter(backwards: true)
	print( step(start) )

	step = chooseStepBetter(backwards: false)
	print( step(start) )
}

func main() {
	print("\nFunction: playWithVaridiacArguments")
	playWithVaridiacArguments()

	print("\nFunction: playWithMultipleReturnValuesBetter")
	playWithMultipleReturnValuesBetter()

	print("\nFunction: playWithMultipleReturnValuesBest")
	playWithMultipleReturnValuesBest()

	print("\nFunction: playWithFunctions")
	playWithFunctions()

	print("\nFunction: playWithExternalArguments")
	playWithExternalArguments()
	
	print("\nFunction: playWithSwapping")
	playWithSwapping()

	print("\nFunction: playWithFunctionTypes")	
	playWithFunctionTypes()

	print("\nFunction: playWithCalculator")	
	playWithCalculator()

	// print("\nFunction: playWithChoices")
	// playWithChoices()

	// print("\nFunction: marchTowardsNothingness")	
	// marchTowardsNothingness(value: 3)
	// print("OnceMore...")
	// marchTowardsNothingness(value: -3)


	// print("\nFunction: playWithMarching")	
	// playWithMarching()
	// // print("\nFunction: ")	

	print("\nFunction: playWithChoicesBetter")
	playWithChoicesBetter()

}

main()

