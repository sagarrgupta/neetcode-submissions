class Twitter {
    
    var users = [Int: (followedUsers: Set<Int>, postedTweets: [Tweet])]()

    func postTweet(_ userId: Int, _ tweetId: Int) {
        var currentUser = users[userId, default: (followedUsers: [], postedTweets: [])]
            
        currentUser.postedTweets.append(Tweet(tweetId: tweetId, timeStamp: Date().timeIntervalSince1970))
        if currentUser.postedTweets.count > 10 {
            currentUser.postedTweets.removeFirst()
        }
        users[userId] = currentUser
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var allFeeds = [Tweet]()
        
        guard let currentUser = users[userId] else { return [] }
        allFeeds.append(contentsOf: currentUser.postedTweets)
        
        for followedUser in currentUser.followedUsers {
            guard let followedUserTweets = users[followedUser]?.postedTweets else { continue }
            allFeeds.append(contentsOf: followedUserTweets)
        }
        allFeeds = Array(Set(allFeeds))
        allFeeds.sort { $0.timeStamp > $1.timeStamp }
        return Array(allFeeds.prefix(10)).map { $0.tweetId }
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }
        users[followerId, default: (followedUsers: [], postedTweets: [])].followedUsers.insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }
        let index = users[followerId, default: (followedUsers: [], postedTweets: [])].followedUsers.firstIndex {
            $0 == followeeId
        }
        
        if let index = index {
            users[followerId, default: (followedUsers: [], postedTweets: [])].followedUsers.remove(at: index)
        }
    }
}

struct Tweet: Hashable {
    let tweetId: Int
    let timeStamp: Double
}