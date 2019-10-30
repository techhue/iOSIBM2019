//Encapsulation 

class Counter {
    var count = 0

    func increment() {
        count = count + 1
    }

    func incrementBy(amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

func playWithCounter() {
	let counter = Counter()
	counter.increment()
	counter.incrementBy(amount: 5)
	counter.reset()
	print(counter.count)
}

struct Point {
    var x = 0.0, y = 0.0
    mutating func isToTheRightOfX(x: Double) -> Bool {
    	self.y = 100.0
        return self.x > x
    }
}

func playWithPoint() {
	var somePoint = Point(x: 4.0, y: 5.0)
	print(somePoint)
	if somePoint.isToTheRightOfX(x: 1.0) {
	    print("This point is to the right of the line where x == 1.0")
	}
	print(somePoint)
}

func main() {
	print("\nFunction : playWithCounter")
	playWithCounter()

	print("\nFunction : playWithPoint")
	playWithPoint()

	// print("\nFunction : ")
	// print("\nFunction : ")
}

main()
