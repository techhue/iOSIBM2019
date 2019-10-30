
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

//Bangalore Autowala's Design
//Parent Immutable  -> Immutability Is Infectious
//Parent Mutable 	-> Mutability Is Not Infectious

func playWithStructures() {
	var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
	rangeOfThreeItems.firstValue = 6
	//rangeOfThreeItems.length = 19

	print(rangeOfThreeItems)
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
	//Stored Properties
    var origin = Point()
    var size = Size()

    //Computed Properties
    var center: Point {
	    get {
	        let centerX = origin.x + (size.width / 2)
	        let centerY = origin.y + (size.height / 2)
	        return Point(x: centerX, y: centerY)
	    }
	   	set {
	        origin.x = newValue.x - (size.width / 2)
	        origin.y = newValue.y - (size.height / 2)
	    }
	    // set(newCenter) {
	    //     origin.x = newCenter.x - (size.width / 2)
	    //     origin.y = newCenter.y - (size.height / 2)
	    // }
    }
}
func playWithStructures1() {
	var square = Rect(origin: Point(x: 0.0, y: 0.0), 
		size: Size(width: 10.0, height: 10.0))

	//let initialSquareCenter = square.center
	print(square.center)
	print(square.origin)
	
	square.center = Point(x: 15.0, y: 15.0)
	//square.setCenter( Point(x: 15.0, y: 15.0) )
	
	print(square.center)
	//square.getCenter()

	print(square.origin)
	
	square.origin = Point(x: 0.0, y: 0.0)
	print(square.center)
	print(square.origin)
	//print("square.origin : (\(square.origin.x), \(square.origin.y))")
}

class StepCounter {
    var totalSteps: Int = 0 {
    	willSet {
	        print("About to set totalSteps to \(newValue)")
	    }

	    // willSet(newTotalSteps) {
	    //     print("About to set totalSteps to \(newTotalSteps)")
	    // }
	    didSet {
	        if totalSteps > oldValue {
	            print("Added \(totalSteps - oldValue) steps")
	            if totalSteps > 1000 { totalSteps = 1000 }
	        }
	    }
    }
}

func playWithClasses() {
	let stepCounter = StepCounter()
	print(stepCounter.totalSteps)
	stepCounter.totalSteps = 200
	print(stepCounter.totalSteps)
	stepCounter.totalSteps = 360
	print(stepCounter.totalSteps)
	stepCounter.totalSteps = 896
	print(stepCounter.totalSteps)

	stepCounter.totalSteps = 1100
	print(stepCounter.totalSteps)

}


func main() {
	print("\nFunction : playWithStructures")
	playWithStructures()

	print("\nFunction : playWithStructures1")
	playWithStructures1()

	print("\nFunction : playWithClasses")
	playWithClasses()
	// print("\nFunction : ")
	// print("\nFunction : ")
}

main()
