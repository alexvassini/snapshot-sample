import RxSwift
import Moya

protocol FeedRepository: class {

    func searchRepositories(language: String, page: Int) -> Single<[GitRepository]>

}
