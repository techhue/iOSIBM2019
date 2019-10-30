

enum CompassPoint: Int {
	case North = 1
	case South
	case East
	case West
}

func playWithEnums(direction: CompassPoint) {
	// var direction = CompassPoint.North
	// direction = CompassPoint.South

	switch direction {
		case .North:
			print("Heading North...")
		case .South:
			print("Heading South...")
		case .East:
			print("Heading East...")
		case .West:
			print("Heading West...")
		// default:
		// 	print("Manzil Ka Pata Nahin...")
	}
}

func main() {
	print("\nFunction : playWithEnums")
	playWithEnums(direction: CompassPoint.South)
	playWithEnums(direction: .North)
	print(CompassPoint.North)
	print(CompassPoint.West)
	print(CompassPoint.North.rawValue)
	print(CompassPoint.West.rawValue)
}


main()
