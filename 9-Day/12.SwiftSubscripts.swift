
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

//six times three is 18
func playWithTimeTable() {
	let threeTimesTable = TimesTable(multiplier: 3)
	print(threeTimesTable[1])
	print(threeTimesTable[2])
	print(threeTimesTable[3])
	print(threeTimesTable[4])
	print(threeTimesTable[5])
	print("six times three is \(threeTimesTable[6])")
}



func main() {
	print("\nFunction : playWithTimeTable")
	playWithTimeTable()
}

main()