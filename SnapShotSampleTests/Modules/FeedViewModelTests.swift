//
//  FeedViewModelTests.swift
//  SnapShotSampleTests
//
//  Created by Alexandre  Vassinievski on 07/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//

import XCTest
import Nimble
import RxSwift
@testable import SnapShotSample

class FeedViewModelTests: XCTestCase {


    override func setUp() {

    }

    override func tearDown() {

    }

    func test_should_searchRepositories_called() {
        //Given
        let repository = FeedRepositorySpy()
        let viewModel = FeedViewModel(repository: repository)
        //When
        viewModel.results.drive().disposed(by: rx.disposeBag)
        viewModel.requestTrigger.onNext(())
        //Then
        expect(repository.searchRepositoriesCalled).to(beTrue())
    }

    func test_isSearchRepositories_result_starts_empty() {
        //Given
        let repository = FeedRepositorySpy()
        let viewModel = FeedViewModel(repository: repository)
        //When
        viewModel.results.drive(onNext: { (feed) in
            expect(feed).to(beEmpty())
            }).disposed(by: rx.disposeBag)
    }

    func test_isSearchRepositories_is_not_empty() {
        //Given
        let repository = FeedRepositorySpy()
        let viewModel = FeedViewModel(repository: repository)
        //When
        viewModel.results.skip(1).drive(onNext: { (feed) in
            expect(feed).notTo(beEmpty())
            }).disposed(by: rx.disposeBag)
    }

    func test_isSearchRepositories_returnError() {
        let repository = FeedRepositorySpy()
        repository.error = true
        let viewModel = FeedViewModel(repository: repository)

        viewModel.error.subscribe(onNext: { (error) in
            expect(error).notTo(beNil())
        }).disposed(by: rx.disposeBag)

    }

    class FeedRepositorySpy: FeedRepository {

        enum MockError: Error {
            case generic
        }

        var error = false
        var searchRepositoriesCalled = false

        func searchRepositories(language: String, page: Int) -> Single<[GitRepository]> {
            searchRepositoriesCalled = true

            if error {
                let subject = PublishSubject<[GitRepository]>()
                subject.onError(MockError.generic)
                return subject.asSingle()

            } else {
                let decoder = Data.codable(type: GitRepositories.self)
                if let repositories = decoder {
                    return .just(repositories.items)
                }  else {
                    let subject = PublishSubject<[GitRepository]>()
                    subject.onError(MockError.generic)
                    return subject.asSingle()
                }
            }
        }
    }
}
