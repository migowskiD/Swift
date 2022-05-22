import Foundation

//1.1
var first=5
var second=10
var sum=first+second
let formula="\(first) + \(second) = \(sum)"
print(formula)
//1.2
let gdansk = "Gdansk University of Technology"
var ngdansk = ""
for charn in gdansk {
    if charn == "n" {
       ngdansk+="⭐️"
    }
    else {
        ngdansk+="\(charn)"
    }
}
print(ngdansk)
//1.3
var name = "Dawid Migowski"
var revname = String(name.reversed())
var revform="\(name) -> \(revname)"
print(revform)



//2.1
for _ in 1...11 {
    print("I will pass this course with best mark, because Swift is great!")
}

//2.2
for i in 1...10 {
    var square = i*i
    print(square)
}

//2.3
for i in 1...10 {
    for j in 1...10 {
        print("@", terminator: "")
    }
    print("")
}



//3.1
var numbers = [5, 10, 20, 15, 80, 13]
var max = 0
for i in numbers {
    if(i>max) {
        max=i
    }
}
print(max)

//3.2
var numb1 = numbers.reversed()
for i in numbers.reversed() {
    print("\(i)", terminator: ", ")
}
print("")

//3.3
var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]
var unique = [Int]()
for i in allNumbers {
    if !(unique.contains(i)){
        unique.append(i)
    }
}
print(unique)



//4.1
var number = 10
var divisors = Set<Int>()
for i in 1...number {
    if number%i==0 {
        divisors.insert(i)
    }
}
print(divisors.sorted())



//5.1
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]

var flightNumbers=[String]()
for i in flights {
    flightNumbers.append(i["flightNumber"]!)
}
print(flightNumbers)

//5.2
var fullName = [[String : String]]()
var names = ["Hommer","Lisa","Bart"]
for i in names {
    fullName.append(["lastName":"Simpson", "firstName":i])
}
print(fullName)