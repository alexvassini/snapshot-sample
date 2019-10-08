import RxSwift
import RxCocoa
import RxSwiftExt
import RxSwiftUtilities
import Moya

class FeedViewModel {
    
    let repository: FeedRepository
    
    let results: Driver<[GitRepository]>
    let isLoading: Driver<Bool>
    let error: Observable<RequestError?>
    let requestTrigger: PublishSubject<Void> = PublishSubject()
    
    init(repository: FeedRepository = FeedRepositoryImpl()) {
        
        self.repository = repository
        
       let loadingIndicator = ActivityIndicator()
        
        self.isLoading = loadingIndicator
            .startWith(false)
            .asDriver()
        
        let currentPage = BehaviorSubject<Int>(value: 1)
        
        let response = requestTrigger
            .withLatestFrom(isLoading)
            .filter { $0 == false }
            .withLatestFrom(currentPage)
            .flatMapLatest { page in
                repository.searchRepositories(language: "swift", page: page)
                .do(onSuccess: { _ in currentPage.onNext(page + 1) } )
                .trackActivity(loadingIndicator)
            }.materialize()
        
        let feedResult = response
            .elements()
            .startWith([])
        
        self.results = feedResult
            .scan([], accumulator: +)
            .asDriver(onErrorJustReturn: [])

        self.error = response
            .errors()
            .map { $0 as? MoyaError }
            .unwrap()
            .mapError(RequestError.self)

    }
    
}
