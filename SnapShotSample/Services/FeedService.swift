import Foundation
import Moya
import RxSwift

protocol FeedService {

    func searchRepositories(language: String, page: Int) -> Single<Response>

}
