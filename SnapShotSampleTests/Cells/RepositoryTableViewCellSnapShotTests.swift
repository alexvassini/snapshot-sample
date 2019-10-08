//
//  RepositoryTableViewCellSnapShotTests.swift
//  SnapShotSampleTests
//
//  Created by Alexandre  Vassinievski on 08/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//

import FBSnapshotTestCase
import RxSwift
@testable import SnapShotSample

class FBSnapshotTestCaseExampleTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        self.recordMode = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRepositoryTableViewCell() {
        // Given
       let viewModel = FeedViewModel(repository: FeedRepositorySpy())
        let sut = FeedViewController(viewModel: viewModel)

        FBSnapshotVerifyView(sut.view)


    }

    class FeedRepositorySpy: FeedRepository {

        func searchRepositories(language: String, page: Int) -> Single<[GitRepository]> {

                let decoder = Data.codable(type: GitRepositories.self)
                if let repositories = decoder {
                    return .just(repositories.items)

            }
                else { return .just([])}
        }
    }

}
