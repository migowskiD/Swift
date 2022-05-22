import Foundation

enum TypeOfPost:String {
    case Tweet = "tweet"
    case Reply = "reply"
}

struct Stats {
    var retweets:Int
    var quoteTweets:Int
    var likes:Int
    init(_ retweets:Int,_ quoteTweets:Int,_ likes:Int){
        self.retweets = retweets
        self.quoteTweets = quoteTweets
        self.likes = likes
    }
}

func numberFormatter (_ number:Int) -> String{
    var answer = "\(number)"
    if number > 1000 {
        answer = "\(number/1000)k"
    }
    return answer
}

class Post {
    var author:String
    var date:String
    var type: TypeOfPost
    var stats:Stats
    var text:String
    init(_ author:String,_ date:String,_ type:TypeOfPost,_ stats:Stats,_ text:String){
        self.author = author
        self.date = date
        self.type = type
        self.stats = stats
        self.text = text
    }
    
    func printPost(){
        print("Author: \(author)")
        print("Date: \(date)")
        print("Type: \(type)")
        print("Retweets: \(numberFormatter(stats.retweets)) Quote tweets: \(numberFormatter(stats.quoteTweets)) Likes: \(numberFormatter(stats.likes))")
        print("Content of Tweet: \(text)")
    }
}

class PostWithMedia:Post {
    var mediaUrl:String
    var views:Int
    init(_ author:String,_ date:String,_ type:TypeOfPost,_ stats:Stats,_ text:String,_ mediaUrl:String,_ views:Int){
        self.mediaUrl = mediaUrl
        self.views = views
        super.init(author, date, type, stats, text)
    }
    
    override func printPost(){
    super.printPost()
    print("Media: \(mediaUrl) Views: \(numberFormatter(views))")
    }
}

let newPost = Post("TwitterUser","18:00 19-04-2022",TypeOfPost.Tweet,Stats(100,10,123456),"What's happening?")
newPost.printPost()

let newMediaPost = PostWithMedia("TwitterUser1","18:20 19-04-2022",TypeOfPost.Reply,Stats(11,12,10000),"Haha", "funnycats.gif", 100123)
newMediaPost.printPost()
