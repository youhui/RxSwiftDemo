import ObjectMapper

struct GankModel: Mappable {
    
    var _id: String?
    var createdAt: String?
    var desc: String?
    var publishedAt: String?
    var source: String?
    var type: String?
    var url: String?
    var used: String?
    var who: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        _id         <- map["_id"]
        createdAt   <- map["createdAt"]
        desc        <- map["desc"]
        publishedAt <- map["publishedAt"]
        source      <- map["source"]
        type        <- map["type"]
        url         <- map["url"]
        used        <- map["used"]
        who         <- map["who"]
    }
}
