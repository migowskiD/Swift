//1.1
func minValue (_ a:Int,_ b:Int)-> Int {
    if (b < a) {
        return b
    }
    else {
        return a
    }
}
print(minValue(1,3))

//1.2
func lastDigit(_ a:Int) -> Int {
    return a%10
}
print(lastDigit(123))

//1.3
func divides(_ a:Int, _ b:Int) -> Bool {
    return a%b==0
}

func countDivisors(_ a:Int) -> Int {
    var count=0
    for i in 1...a {
        if(divides(a,i)){
            count += 1
        }
    }
    return count
}

func isPrime(_ a:Int) -> Bool {
    return countDivisors(a)==2
}

print(divides(7,3))
print(divides(8,4))

print(countDivisors(1))
print(countDivisors(10))
print(countDivisors(12))

print(isPrime(3))
print(isPrime(8))
print(isPrime(13))


//2.1
func smartBart (_ n:Int,f:()->()){
    for i in 1...n{
        f()
    }
}
smartBart(3){print("I will pass this course with best mark, because Swift is great!")}

//2.2
let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
print(numbers.filter{$0%4==0})

//2.3
print(numbers.reduce(0){
    if ($0 > $1){
        return $0
    }
    else{
        return $1
    }
})

//2.4
var strings = ["Gdansk", "University", "of", "Technology"]
print(strings.reduce(""){$0 + " " + $1})

//2.5
let number = [1, 2 ,3 ,4, 5, 6]
let odd = number.filter{$0%2==1}
let squares = odd.map{$0*$0}
print(squares.reduce(0){$0 + $1})



//3.1
func minmax(_ a:Int, _ b:Int) -> (min: Int, max: Int){
    if(a<b){
        return (a,b)
    }
    else{
        return (b,a)
    }
}
print(minmax(10,12))

//3.2
func stringCounter(_ strings: [String])->[(String, Int)]{
    var arr = strings
    var countedStrings:[(String, Int)] = []
    var i=0
    while(i<arr.count){
        var counter = 1
        var j=i+1
        while(j<arr.count){
            if(arr[i] == arr[j]){
                counter += 1
                arr.remove(at: j)
            }
            else{
                j+=1
            }
        }
        countedStrings.append((arr[i],counter))
    i+=1
    }
    return countedStrings
}
var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of", "technology", "technology", "gdansk", "gdansk"]
print(stringCounter(stringsArray))


//4.1
enum Day:Int {
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7

    func emojiDescription() -> String {
        switch self{
            case .Monday:
                return "🙌"
            case .Tuesday:
                return "🏆"
            case .Wednesday:
                return "🎉"
            case .Thursday:
                return "👩‍💻"
            case .Friday:
                return "🍾"
            case .Saturday:
                return "👨‍💻"
            case .Sunday:
                return "🐍"
        }
    }
}
 let day = Day.Friday
 print(day.emojiDescription())
 print(Day.Monday.emojiDescription())
 print(Day.Sunday.emojiDescription())
