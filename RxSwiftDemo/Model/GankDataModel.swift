import ObjectMapper

struct GankDataModel: Mappable {
    
    var error: Bool = false
    
    var results: [GankModel]?
   
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        error     <- map["error"]
        results   <- map["results"]
    }
}
