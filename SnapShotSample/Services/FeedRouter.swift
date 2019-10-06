import Foundation
import Moya

enum FeedRouter {

    case searchRepositories(language: String, page: Int)
}

extension FeedRouter: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com/search")!
    }

    var path: String {
        switch self {
        case .searchRepositories:
            return "/repositories"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data.mocked(type: GitRepositories.self)
    }
    
    var task: Task {
        switch self {
        case .searchRepositories(let language, let page):

            let parameters: [String : Any] = ["q": "language:\(language)",
                                              "sort": "stars",
                                              "page": page]

            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)

        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
