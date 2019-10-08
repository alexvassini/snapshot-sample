//
//  FeedViewControllerTests.swift
//  SnapShotSampleTests
//
//  Created by Alexandre  Vassinievski on 07/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//

import XCTest
import Nimble
import RxSwift
import RxCocoa
@testable import SnapShotSample

class FeedViewControllerTests: XCTestCase {

    var window: UIWindow!

    override func setUp() {
        self.window = UIWindow()
    }

    override func tearDown() {
        self.window = nil
    }

    func test_should_showLoadingView_called() {
        let loadingViewSpy = LoadingViewSpy()
        let viewModel = FeedViewModelSpy()
        let view = FeedViewController(viewModel: viewModel)

        view.loadingView = loadingViewSpy
        loadView(window: window, viewController: view)

        viewModel.isLoadingSubject.onNext(true)

        expect(loadingViewSpy.showLoadingCalled)
            .toEventually(equal(true))

    }

    func test_should_hideLoadingView_called() {
           let loadingViewSpy = LoadingViewSpy()
           let viewModel = FeedViewModelSpy()
           let view = FeedViewController(viewModel: viewModel)

           view.loadingView = loadingViewSpy
           loadView(window: window, viewController: view)
           viewModel.isLoadingSubject.onNext(false)

           expect(loadingViewSpy.hideLoadingCalled)
               .toEventually(equal(true))

       }

    func test_setupBindings_should_call_requesterTrigger () {

        let viewModel = FeedViewModelSpy()
        let view = FeedViewController(viewModel: viewModel)

        loadView(window: window, viewController: view)

        expect(viewModel.requestTriggerCalled)
        .to(equal(true))

    }

    class FeedViewModelSpy: FeedViewModel {

        let isLoadingSubject = PublishSubject<Bool>()
        var requestTriggerCalled = false
        var requestTriggerCalledCount = 0

        override init(repository: FeedRepository = FeedRepositoryImpl()) {
            super.init()

            isLoading = isLoadingSubject.asDriver(onErrorJustReturn: false)

            _ = requestTrigger.bind { _ in
                self.requestTriggerCalledCount += 1
                self.requestTriggerCalled = true
            }

        }
    }

    class LoadingViewSpy: LoadingView {

        var showLoadingCalled = false
        var hideLoadingCalled = false

        override func show() {
            showLoadingCalled = true
        }

        override func hide() {
            hideLoadingCalled = true
        }

    }
}
