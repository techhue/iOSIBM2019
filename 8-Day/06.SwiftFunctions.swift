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
func sum(_ x: Int, _ y: Int) -> Int {
	//Calling C/C++ Sum Function internally
	print("Calling C/C++ Code")
	return 0
}
//ALWAYS: Follow Named Arguments - Readability is Better
func sum(x: Int, y: Int) -> Int {
	return sum(x, y)
}

func playWithExternalArguments() {
	print("\nFunction: join")
	print(joinOld(s1: "Hello", s2: "World!", joiner: "  "))

	print("\nFunction: join")
	print(join(string: "Ding", toString: "Dong"))

	print("\nFunction: join")
	print(join(string: "Ding", toString: "Dong", withJoiner: "   " ))

	print("\nFunction: sum")
	//print(sum(x: 10, y: 20))
	print(sum(10, 20))
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
	// print("\nFunction: ")
	// print("\nFunction: ")	
}

main()

