import UIKit
import Moya
import RxSwift

class FeedRepositoryImpl: FeedRepository {
    
    let service: FeedService
    
    init(service: FeedService = FeedServiceImpl()) {
        self.service = service
    }

    func searchRepositories(language: String, page: Int) -> Single<[GitRepository]> {
        return self.service.searchRepositories(language: language, page: page)
            .map(GitRepositories.self)
            .map{$0.items}
    }
}
