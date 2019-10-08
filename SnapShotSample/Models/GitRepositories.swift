struct GitRepositories: Codable {
    var totalCount: Int
    var items: [GitRepository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct RequestError: Codable {
    let message: String
}
