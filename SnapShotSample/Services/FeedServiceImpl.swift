import Foundation
import RxSwift
import Moya


class FeedServiceImpl: NSObject, FeedService {

    let provider: MoyaProvider<FeedRouter>

    init(provider: MoyaProvider<FeedRouter> = MoyaProvider<FeedRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])) {
        self.provider = provider
        super.init()
    }

    func searchRepositories(language: String, page: Int) -> Single<Response> {
        return provider.rx.request(.searchRepositories(language: language, page: page))
    }

}
