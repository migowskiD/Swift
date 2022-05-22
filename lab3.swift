import Foundation

//DATA MODEL

struct Location {
    var id:Int
    var type:String
    var name:String
    var rating:Int
    
    init(_ id:Int,_ type:String, _ name:String,_ rating:Int){
        self.id = id
        self.type = type
        self.name = name
        self.rating = rating
    }
}
class City {
    var id:Int
    var name:String
    var description:String
    var latitude:Double
    var longitude:Double
    var keyword:[String]
    var locations:[Location] = []

    init(_ id:Int,_  name:String,_ description:String,_ latitude:Double,_ longitude:Double,_ keyword:[String] ) {
        self.id = id
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.keyword = keyword
    }
    init(_ latitude:Double,_ longitude:Double){
        self.id = 0
        self.name = ""
        self.description = ""
        self.latitude = latitude
        self.longitude = longitude
        self.keyword = []
    }
}

var cities = [City(1, "Warsaw", "Capital of Poland", 52.237049, 21.017532, ["poland", "capital","party"]),
City(2,"London", "Capital of UK", 51.509865, -0.118092, ["uk", "capital", "sport"]),
City(3,"Havana", "Big city", 23.113592, -82.366592, ["cuba", "party", "music"]),
City(4,"Havana", "Big city", 50.113592, -70.366592, ["party", "music"]),
City(5,"Havana", "Big city", 55.113592, -0.366592, ["party", "music", "seaside"]),
City(6,"Roma", "Big city", 41.902782, 12.496366, ["monuments", "capital"]),
City(7,"Roma", "Big city", 20.902782, 22.496366, ["monuments", "architecture"]),
City(8,"Roma", "Big city", 30.902782, 32.496366, ["monuments", "architecture"]),
City(9,"Roma", "Big city", 40.902782, 42.496366, ["monuments", "party"]),
City(10, "Los Angeles" , "Big city", 34.052235, -68.243683, ["music", "party"]),
City(11, "Los Angeles" , "Big city", 24.052235, -18.243683, ["seaside", "party"]),
City(12, "Los Angeles" , "Big city", 14.052235, -78.243683, ["sport", "party"]),
City(13, "Los Angeles" , "Small city", -4.052235, -28.243683, ["nature", "party"]),
City(14, "Washington DC", "Capital City", 38.889248, -77.050636, ["usa", "capital"]),
City(15, "Washington", "City", 45.889248, -80.050636, ["music", "nature"]),
City(16, "Washington", "City", 40.889248, -77.050636, ["usa", "sport"]),
City(17, "Washington", "City", 60.889248, -70.050636, ["party", "nature"]),
City(18, "Washington", "City", 33.889248, -70.050636, ["usa", "sport"]),
City(19, "Paris", "City of Europe", 48.864716, 2.349014, ["europe", "music"]),
City(20, "Paris", "City in Texas", 33.6609389, -95.555513, ["america", "texas"])]

//SEARCH
func citiesByName(_ name:String) -> [City]{
    var answer:[City] = []
    for city in cities{
        if city.name == name{
            answer.append(city)
        }
    }
    return answer
}

print(citiesByName("Washington").count)

func citiesByKeyword(_ keyword:String) -> [City]{
    var answer:[City] = []
    for city in cities{
        for key in city.keyword{
            if keyword == key{
                answer.append(city)
            }
        }
    }
    return answer
}

print(citiesByKeyword("party").count)

//DISTANCE
func deg2rad(_ number: Double) -> Double {
    return number * .pi / 180
}

func distanceCities(_ city1:City, _ city2:City) -> Double {

    var lat1 = deg2rad(city1.latitude)
    var long1 = deg2rad(city1.longitude)
    var lat2 = deg2rad(city2.latitude)
    var long2 = deg2rad(city2.longitude)

    //Haversine Formula
    var dlong = long2 - long1
    var dlat = lat2 - lat1

    var answer = pow(sin(dlat/2),2) + cos(lat1)*cos(lat2)*pow(sin(dlong/2),2)
    answer = 2*asin(sqrt(answer))

    //Radius of Earth in km
    let r = 6371.0

    answer = answer * r

    return answer
}

print(distanceCities(cities[0],cities[1]))

func closestAndFarthestFromUser(_ lat:Double,_ long:Double) -> String{

    var userCity = City(lat,long)
    var closest  = 100000000.0
    var farthest = 0.0
    var cCity = cities[0]
    var fCity = cities[0]
    for city in cities{
        var distance = distanceCities(userCity, city)
        if distance > farthest {
            farthest = distance
            fCity = city
        }
        if distance < closest {
            closest = distance
            cCity = city
        }
    }
    return "Closest: \(cCity.id) \(cCity.name) Farthest: \(fCity.id) \(fCity.name)"
}

print(closestAndFarthestFromUser(1.0,1.0))

func twoFarthest() -> String{
    var farthest = 0.0
    var fCity = cities[0]
    var sCity = cities[1]
    for i in 0...cities.count-2 {
        for j in i+1...cities.count-1{
            var distance = distanceCities(cities[i], cities[j])
            if distance > farthest {
                farthest = distance
                fCity = cities[i]
                sCity = cities[j]
            }
        }
    }
    return "Two farthest: \(fCity.id) \(fCity.name) and \(sCity.id) \(sCity.name) with \(farthest)km"
}

print(twoFarthest())

//EXTEND DATA MODEL

for i in 0...cities.count-1{
    var id = 1
    if i % 4 == 0{
        cities[i].locations.append(Location(id, "Restaurant", "Fancy Restaurant",5))
        id+=1
    }
    if i % 2 == 1{
        cities[i].locations.append(Location(id, "Restaurant", "McDonalds",3))
        id+=1
    }
    if i % 2 == 0{
        cities[i].locations.append(Location(id, "Museum", "Museum of Art",4))
        id+=1
    }
    if i % 3 == 0{
        cities[i].locations.append(Location(id, "Hotel", "Sheraton",5))
        id+=1
    }
}

//ADVANCE SEARCH
func restaurantFiveStar () -> [City] {
    var answer:[City] = []
    for city in cities{
        for loc in city.locations {
            if loc.type == "Restaurant" && loc.rating == 5 {
                answer.append(city)
            }
        }
    }
    return answer
}

for city in restaurantFiveStar(){
    print("\(city.id) \(city.name)")
}

func allLocations(_ city:City) -> [Location]{
    let  answer = city.locations.sorted{$0.rating > $1.rating}
    return answer
}

for loc in allLocations(cities[12]){
    print("\(loc.name) \(loc.rating)")
}

func allFiveStarLoc(){
    for city in cities{
        var answer = "\(city.id) \(city.name):"
        var counter = 0
        for loc in city.locations{
            if loc.rating == 5{
                answer+=" \(loc.name),"
                counter+=1
            }
        }
        answer+=" City got \(counter) location/s with 5 star rating!"
        print(answer)
    }
}

allFiveStarLoc()
