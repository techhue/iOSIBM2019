
//Value Types
//Int, Character, Float, Double, String
//Enums, Arrays, Struct

//Compiler Generates Following Code
	//getter and setter for width
	//getter and setter for height
	//Memberwise Constructor
	//	 Resolution(width: 0, height: 0)

struct Resolution {
	var width = 0
	var height = 0
}


//Reference Types
class VideoMode {
	var resolution = Resolution()
	var framerate = 0.0
	var name: String?
}

func playWithClassesAndStructures() {
	let hd = Resolution(width: 1920, height: 1080)
	print(hd)
	var cinema = hd

	cinema.width = 2048
	print("HD : \(hd)")
	print("cinema : \(cinema)")

	let tenEighty = VideoMode()
	tenEighty.resolution = hd
	tenEighty.framerate = 60
	tenEighty.name = "1080i"

	let alsoTenEighty = tenEighty
	alsoTenEighty.framerate = 75

	print(tenEighty.framerate)
	print(alsoTenEighty.framerate)

	if tenEighty === alsoTenEighty {
		print("Aiyeooo Aiyeeooooo....")
	}

	// if tenEighty == alsoTenEighty {
	// 	print("Aiyeooo Aiyeeooooo....")
	// }

}

func main() {
	print("\nFunction : playWithClassesAndStructures")
	playWithClassesAndStructures()
}

main()
