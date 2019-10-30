import UIKit


func join( s1 : String, s2 : String, joiner : String) -> String{
//    joiner = s1 + s2;
    return joiner+s1+s2
}
func join( frstString s1 : String, toString s2 : String, withJoin joiner : String) -> String{
//    joiner = s1 + s2;
    return join(s1: s1, s2: s2, joiner: joiner)
}

func mean(num: Double...) -> Double{
    var sum = 0.0
    for n in num{
        sum += n
    }
    return sum
}


func minMaxBest(num : [Int]) -> (min : Int , max : Int)?{
    var max = Int.min //num[0]//INT_MIN
    var min = Int.max //INT_MAX
    if(num.isEmpty){ return (nil)}
    for n in num{
        if(n < min)
        {
            min = n
        }
        else if(n > max){
            max = n
        }
    }
    return (min , max)
}


func minMax(num : [Int]) -> (min : Int , max : Int){
    var max = Int.min //num[0]//INT_MIN
    var min = Int.max //INT_MAX
    if(num.isEmpty){ return (min,max)}
    for n in num{
        if(n < min)
        {
            min = n
        }
        else if(n > max){
            max = n
        }
    }
    return (min , max)
}

func isValidMinMax( result: (min : Int, max: Int)) -> Bool{
    if(result.max<result.min)
    {
        return false
    }
    else { return true }
}

func main(){
    if let result = minMaxBest(num: []){
        print(result.max,result.min)
    }
    else
    {
        print("ERROR")
    }
    let result1 = minMax(num: [])
    if(isValidMinMax(result: result1)){
        print(result1.max,result1.min)
    }
    else
    {
        print("ERROR1111")
    }
//    print(result.min,result.max)
//    print("\(result.min)")
//    join(frstString: "Hello", toString: " hii", withJoin: " ")
//    print(mean(num: 1,2,3,654,354,34))
}

main()
