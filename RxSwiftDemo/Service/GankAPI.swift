import UIKit
import Moya

let GankProvider = MoyaProvider<GankAPI>()

enum GankAPI {
    case gankList(category: String, size: Int, index: Int)
}

extension GankAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://gank.io/api/data/")!
    }
    
    var path: String {
        switch self {
        case .gankList(let category, let size, let index):
            return "\(category)/\(size)/\(index)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
