//
//  RepositoryTableViewCellTests.swift
//  SnapShotSampleTests
//
//  Created by Alexandre  Vassinievski on 07/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//
import XCTest
import Nimble
@testable import SnapShotSample

class RepositoryTableViewCellTests: XCTestCase {

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

    func testShouldHaveAnIndentifier() {
        // Then
        XCTAssertGreaterThan(RepositoryTableViewCell.reuseIdentifier.count, 0)
    }

    func testSelectionStyleShouldBeDefault() {
        // When
        let sut = RepositoryTableViewCell()

        // Then
        XCTAssertEqual(sut.selectionStyle, .none)
    }

    func testBindViewShouldUpdateViews() {
        // Given
        let sut = RepositoryTableViewCell()
        let viewModel = RepositoryTableViewCellViewModel(item: self.gitRepository)
        
        // When
        sut.bindView(viewModel)

        // Then
        expect(sut.ownerNameLabel.text).to(equal(viewModel.getOwnerName()))
        expect(sut.descriptionLabel.text).to(equal(viewModel.getDescription()))
        expect(sut.nameLabel.text).to(equal(viewModel.getName()))
        expect(sut.starsLabel.text).to(equal(viewModel.getStars()))

    }
}
