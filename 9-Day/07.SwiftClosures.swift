

func backwards(s1: String, s2: String) -> Bool {
	return s1 > s2
}

func forwards(s1: String, s2: String) -> Bool {
	return s1 < s2
}

func backwards(s1: Int, s2: Int) -> Bool {
	return s1 > s2
}

func forwards(s1: Int, s2: Int) -> Bool {
	return s1 < s2
}

func playWithSortedFunction() {
	let names = ["Ding", "Dong", "King", "Kong", "Ming", "Mong"]
	var reversed = names.sorted(by: backwards)
	print(reversed)

	reversed = names.sorted(by: forwards)
	print(reversed)

	let numbers = [100, -90, 90, 80, 70, 1000]
	var reversedNum = numbers.sorted(by: backwards)
	print(reversedNum)

	reversedNum = numbers.sorted(by: forwards)
	print(reversedNum)
}

func playWithClosuresConcept() {
	let add: (Int, Int) -> Int = { (x: Int, y: Int) -> Int in return x + y }
	print(add(10, 20))
	print(add(-10, 20))

	let add1: (Int, Int) -> Int = { (x, y) -> Int in return x + y }	
	print(add1(10, 20))
	print(add1(-10, 20))
}

func playWithClosures() {
	let names = ["Ding", "Dong", "King", "Kong", "Ming", "Mong"]
	
	var reversed = names.sorted(by: { (s1: String, s2: String) -> Bool 
	in return s1 > s2 } )
	print(reversed)

	reversed = names.sorted(by: { (s1: String, s2: String) -> Bool 
	in return s1 < s2 } )
	print(reversed)

	let numbers = [100, -90, 90, 80, 70, 1000]
	var reversedNum = numbers.sorted(by: { (s1: Int, s2: Int) -> Bool 
	in return s1 > s2 } )
	print(reversedNum)

	reversedNum = numbers.sorted(by: { (s1: Int, s2: Int) -> Bool 
	in return s1 < s2 } )
	print(reversedNum)

	reversed = names.sorted(by: { (s1 , s2) -> Bool in return s1 > s2 } )
	print(reversed)

	reversed = names.sorted(by: { (s1 , s2) in return s1 > s2 } )
	print(reversed)

	reversed = names.sorted(by: { $0 > $1 } )
	print(reversed)

	reversed = names.sorted(by: > )
	print(reversed)

	reversed = names.sorted(by: < )
	print(reversed)
}

func main() {
	print("\nFunction : playWithSortedFunction")
	playWithSortedFunction()

	print("\nFunction : playWithClosures")
	playWithClosures()
}

main()
