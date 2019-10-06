//
//  GitRepositoty.swift
//  SnapShotSample
//
//  Created by Alexandre  Vassinievski on 06/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//

struct GitRepositories: Codable {
    var totalCount: Int
    var items: [GitRepository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

// MARK: - Item
struct GitRepository: Codable {

    var id: Int
    var nodeId: String
    var name: String
    var homePageUrl: String
    var description: String
    var owner: Owner

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case homePageUrl = "html_url"
        case owner
        case description
    }
}

struct Owner: Codable {
    let name: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case photo = "avatar_url"
    }

}
