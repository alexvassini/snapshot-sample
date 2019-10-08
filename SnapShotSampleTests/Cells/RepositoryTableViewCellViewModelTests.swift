//
//  RepositoryTableViewCellViewModelTests.swift
//  SnapShotSampleTests
//
//  Created by Alexandre  Vassinievski on 07/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//

import XCTest
import Nimble
@testable import SnapShotSample

class RepositoryTableViewCellViewModelTests: XCTestCase {

    var gitRepository: GitRepository!

    override func setUp() {
        super.setUp()
        let decoder = Data.codable(type: GitRepository.self)
        guard let repository = decoder else { return XCTFail("git reposotory should not be nil") }
        gitRepository = repository

    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetImageShouldReturnOwnerImageUrl() {
        let viewModel = RepositoryTableViewCellViewModel(item: gitRepository)

        expect(viewModel.getImage()).notTo(beNil())
    }

    func testGetOwnerNameShouldReturnOwnerName() {
        let viewModel = RepositoryTableViewCellViewModel(item: gitRepository)

        expect(viewModel.getOwnerName()).to(equal("Luur"))
    }

    func testGetNameShouldReturnName() {
        let viewModel = RepositoryTableViewCellViewModel(item: gitRepository)

        expect(viewModel.getName()).to(equal("SwiftTips"))
    }

    func testGetDescriptionShouldReturnDescription() {
        let viewModel = RepositoryTableViewCellViewModel(item: gitRepository)

        expect(viewModel.getDescription()).to(equal("Swift tips and tricks"))
    }

    func testGetStarsShouldReturnStars() {
        let viewModel = RepositoryTableViewCellViewModel(item: gitRepository)

        expect(viewModel.getStars()).to(equal("⭐️828"))
    }
}
